cmake_minimum_required(VERSION 2.8.3)
project(control_bottom)

#add_compile_options(-std=c++11)

find_package(catkin REQUIRED COMPONENTS
    roscpp
    std_msgs
    dbw_mkz_msgs
    controller_msgs
    dynamic_reconfigure
)
generate_dynamic_reconfigure_options(
    cfg/Controller.cfg
)

catkin_package(
#  INCLUDE_DIRS include
#  LIBRARIES control
#  CATKIN_DEPENDS roscpp std_msgs
#  DEPENDS system_lib
)

include_directories(
    include
    ${catkin_INCLUDE_DIRS}
)

add_executable(ControlBottom
        src/ControlBottomNode.cpp src/ControlBottom.cpp
        )

add_dependencies(ControlBottom ${dbw_mkz_msgs_EXPORTED_TARGETS} ${controller_msgs_EXPORTED_TARGETS})
add_dependencies(ControlBottom {PROJECT_NAME}_gencfg)

target_link_libraries(ControlBottom
    ${catkin_LIBRARIES}
)
