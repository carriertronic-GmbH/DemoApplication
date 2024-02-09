cmake_minimum_required(VERSION 3.16)
project(ctDemoApp LANGUAGES CXX C)

set(CMAKE_AUTOMOC ON)
set(CMAKE_AUTORCC ON)

find_package(Qt6 REQUIRED COMPONENTS Core Gui Qml Quick SerialPort)

qt_add_executable(ctDemoApp WIN32
    main.cpp
    applicationbridge.cpp
    resources.qrc
    qml.qrc
)

if(CMAKE_BUILD_TYPE STREQUAL "Debug")
    target_compile_definitions(ctDemoApp PRIVATE QT_QML_DEBUG)
endif()

set_target_properties(ctDemoApp PROPERTIES
    RUNTIME_OUTPUT_DIRECTORY "bin"
    ARCHIVE_OUTPUT_DIRECTORY "lib"
    LIBRARY_OUTPUT_DIRECTORY "lib"
    WIN32_EXECUTABLE TRUE
)

target_link_libraries(ctDemoApp PRIVATE
    Qt::Core
    Qt::Gui
    Qt::Qml
    Qt::Quick
    Qt::SerialPort
)

qt_add_qml_module(ctDemoApp
    URI ctDemoApp
    VERSION 1.0
    QML_FILES
      "qml/main.qml"
      "qml/MainHeader.qml"
      "qml/CAN/CANDump.qml"
      "qml/CAN/CAN.qml"
      "qml/Dashboard/DashboardButton.qml"
      "qml/Dashboard/Dashboard.qml"
      "qml/Diashow/Diashow.qml"
      "qml/Diashow/Gallery/Gallery.qml"
      "qml/Diashow/SlideShow/SlideShow.qml"
      "qml/DisplayTest/DisplayTestButton.qml"
      "qml/DisplayTest/DisplayTest.qml"
      "qml/General/Clock.qml"
      "qml/General/IconButton.qml"
      "qml/General/Icon.qml"
      "qml/General/MaterialIcon.qml"
      "qml/MultiTouch/MultiTouchComponent.qml"
      "qml/MultiTouch/MultiTouchIndicator.qml"
      "qml/MultiTouch/MultiTouchPointView.qml"
      "qml/MultiTouch/MultiTouch.qml"
      "qml/Settings/SettingsBrightness.qml"
      "qml/Settings/SettingsFlash.qml"
      "qml/Settings/SettingsNetwork.qml"
      "qml/Settings/Settings.qml"
      "qml/Terminal/Terminal.qml"
)


