#include "applicationbridge.h"
#include <QNetworkInterface>
#include <QJsonObject>
ApplicationBridge::ApplicationBridge(QObject *parent)
    : QObject{parent}
{
	_timer_for_temp = new QTimer(this);
	connect(_timer_for_temp,SIGNAL(timeout()),this,SLOT(timer_temp_timeout()));
	_timer_for_temp->setSingleShot(true);
	_timer_for_temp->start(2500);
	//Initialized can bridge
	initcan();
	usart_serial_port = new QSerialPort(this);
	connect(usart_serial_port,SIGNAL(readyRead()),this,SLOT(comming_data_serial_port()));
}

qreal ApplicationBridge::cpuTempr() const
{
    return m_cpuTempr;
}

void ApplicationBridge::setCpuTempr(qreal newCpuTempr)
{
    if (qFuzzyCompare(m_cpuTempr, newCpuTempr))
        return;
    m_cpuTempr = newCpuTempr;
    emit cpuTemprChanged();
}

qreal ApplicationBridge::gpuTempr() const
{
    return m_gpuTempr;
}

void ApplicationBridge::setGpuTempr(qreal newGpuTempr)
{
    if (qFuzzyCompare(m_gpuTempr, newGpuTempr))
        return;
    m_gpuTempr = newGpuTempr;
    emit gpuTemprChanged();
}

qreal ApplicationBridge::deviceTempr() const
{
    return m_deviceTempr;
}

void ApplicationBridge::setDeviceTempr(qreal newDeviceTempr)
{
    if (qFuzzyCompare(m_deviceTempr, newDeviceTempr))
        return;
    m_deviceTempr = newDeviceTempr;
	emit deviceTemprChanged();
}

void ApplicationBridge::sendSerialCommand(QString cmd)
{
	if(!usart_serial_port->isOpen())
	{
		qWarning() << "serial port is not open: " << usart_serial_port->portName();
        emit sgnSerialDataComming("Serial port is not open: " + usart_serial_port->portName());
		return;
	}
	usart_serial_port->write(cmd.toUtf8());
}

bool ApplicationBridge::openSerialCommand(QString dev_name)
{
	if(usart_serial_port->isOpen())
		usart_serial_port->close();


    // /dev/verdin-uart1‏ or /dev/verdin-uart2
	usart_serial_port->setPortName(dev_name);
	usart_serial_port->setBaudRate(QSerialPort::Baud9600);
	if(!usart_serial_port->open(QSerialPort::ReadWrite))
	{
		qWarning() << "cannot open serial port: " << usart_serial_port->portName();
		return false;
	}
	return true;
}

void ApplicationBridge::closeSerialCommand()
{
	usart_serial_port->close();
}

void ApplicationBridge::setBrightness(int num)
{
	QString command = QString("echo %1 > /sys/devices/platform/backlight-mezzanine/backlight/backlight-mezzanine/brightness").arg(QString::number(num));
	system(command.toStdString().data());
}

QJsonArray ApplicationBridge::read_all_interfaces()
{

	QList<QNetworkInterface> all_int = QNetworkInterface::allInterfaces();
	QJsonArray res;
	foreach (QNetworkInterface  one_int , all_int)
	{
		QJsonObject _obj;
		if(one_int.flags() & QNetworkInterface::IsLoopBack)
			continue;

		_obj.insert("name",one_int.humanReadableName());
		QList<QNetworkAddressEntry> all_addr = one_int.addressEntries();
		QJsonArray ips;
		foreach(QNetworkAddressEntry  one_addr , all_addr)
		{
			if(one_addr.ip().protocol() != QAbstractSocket::IPv4Protocol)
				continue;

			ips.append(one_addr.ip().toString());
		}
		_obj.insert("ips",ips);
		res.append(_obj);
	}
	return res;


}

void ApplicationBridge::flashTEZI(){
    qWarning()<<"Flash TEZI";
}

void ApplicationBridge::timer_temp_timeout()
{
    QProcess prc;
    // Read cpu temp
    prc.start("cat",QStringList() << "/sys/devices/virtual/thermal/thermal_zone0/temp");

    if(prc.waitForFinished(1000))
		setCpuTempr(prc.readAllStandardOutput().toDouble());
	else
		qWarning() << "read cpu temp error";

	// Read gpu temp
	prc.start("cat",QStringList() << "/sys/devices/virtual/thermal/thermal_zone1/temp");
	if(prc.waitForFinished(1000))
		setGpuTempr(prc.readAllStandardOutput().toDouble());
	else
		qWarning() << "read gpu temp error";


	// Read Device temp
	prc.start("cat",QStringList() << "/sys/bus/i2c/devices/3-004f/driver/3-004f/hwmon/hwmon1/temp1_input");
	if(prc.waitForFinished(1000))
		setDeviceTempr(prc.readAllStandardOutput().toDouble());
	else
		qWarning() << "read device temp error";

	_timer_for_temp->start();
}

void ApplicationBridge::comming_data_serial_port()
{
	emit sgnSerialDataComming(usart_serial_port->readAll());
}
