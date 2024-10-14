cmake_minimum_required(VERSION 3.16)

project(SimpleTools VERSION 0.1 LANGUAGES CXX)

set(CMAKE_CXX_STANDARD_REQUIRED ON)
set(CMAKE_AUTORCC ON)

find_package(Qt6 6.5 REQUIRED COMPONENTS Quick)

qt_standard_project_setup(REQUIRES 6.5)

qt_add_executable(appSimpleTool main.cpp)
set_source_files_properties(Colors.qml
    PROPERTIES QT_QML_SINGLETON_TYPE TRUE)
qt_add_qml_module(appSimpleTool
        URI Simple
	VERSION 1.0
	QML_FILES Colors.qml
	QML_FILES ColorpickerItem.qml
	QML_FILES ConverterItem.qml
	QML_FILES Main.qml
	QML_FILES SliderRGB.qml
	QML_FILES UrlencoderItem.qml
	SOURCES main.cpp
	SOURCES urlencoder.cpp urlencoder.h
	SOURCES converter.cpp converter.h
	RESOURCES Fonts.qrc Images.qrc
)
set_target_properties(appSimpleTool PROPERTIES
    MACOSX_BUNDLE_BUNDLE_VERSION ${PROJECT_VERSION}
    MACOSX_BUNDLE_SHORT_VERSION_STRING ${PROJECT_VERSION_MAJOR}.${PROJECT_VERSION_MINOR}
    MACOSX_BUNDLE TRUE
    WIN32_EXECUTABLE TRUE
)
target_link_libraries(appSimpleTool
    PRIVATE Qt6::Quick
)
include(GNUInstallDirs)
install(TARGETS appSimpleTool
    BUNDLE DESTINATION .
    LIBRARY DESTINATION ${CMAKE_INSTALL_LIBDIR}
    RUNTIME DESTINATION ${CMAKE_INSTALL_BINDIR}
)
