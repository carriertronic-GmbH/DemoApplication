#ifndef APPLICATIONBRIDGE_H
#define APPLICATIONBRIDGE_H

#include <QObject>
#include <QDebug>
#include <QProcess>
#include <QTimer>
#include <QSerialPort>
#include <QJsonArray>
class ApplicationBridge : public QObject
{
    Q_OBJECT
    Q_PROPERTY(qreal cpuTempr READ cpuTempr WRITE setCpuTempr NOTIFY cpuTemprChanged)
    Q_PROPERTY(qreal gpuTempr READ gpuTempr WRITE setGpuTempr NOTIFY gpuTemprChanged)
    Q_PROPERTY(qreal deviceTempr READ deviceTempr WRITE setDeviceTempr NOTIFY deviceTemprChanged)

public:
    explicit ApplicationBridge(QObject *parent = nullptr);

	Q_INVOKABLE void initcan()
	{
		system("ip link set can0 type can bitrate 500000");
		system("ip link set can0 up");
	}

	Q_INVOKABLE void cangen()
	{
		system("cangen can0");
    }

	Q_INVOKABLE QString candump()
	{
		QProcess prc;
		prc.start("candump",QStringList() << "-i" << "can0");
		bool res = prc.waitForFinished(5000);
		if(!res)
			return "Start Time out";
		else
			return prc.readAllStandardOutput();
    }

    qreal cpuTempr() const;
    void setCpuTempr(qreal newCpuTempr);

    qreal gpuTempr() const;
    void setGpuTempr(qreal newGpuTempr);

    qreal deviceTempr() const;
    void setDeviceTempr(qreal newDeviceTempr);


    Q_INVOKABLE void sendSerialCommand(QString cmd);
    Q_INVOKABLE bool openSerialCommand(QString dev_name);
    Q_INVOKABLE void closeSerialCommand ();
    Q_INVOKABLE void setBrightness (int num);
    Q_INVOKABLE QJsonArray read_all_interfaces();
    Q_INVOKABLE void flashTEZI();

signals:
    void cpuTemprChanged();
    void gpuTemprChanged();
    void deviceTemprChanged();


    void sgnSerialDataComming(QString responseData);

private:
    qreal m_cpuTempr;
    qreal m_gpuTempr;
    qreal m_deviceTempr;

	QTimer * _timer_for_temp;
	QSerialPort * usart_serial_port;

private slots:
	void timer_temp_timeout();
	void comming_data_serial_port ();
};

#endif // APPLICATIONBRIDGE_H
