project(multiarch_test)

cmake_minimum_required(VERSION 3.13)

set(CMAKE_C_FLAGS "${CMAKE_C_FLAGS} -fPIC")
set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -std=c++17 -pthread -Wimplicit-fallthrough=0 -fPIC")
set(CMAKE_SHARED_LINKER_FLAGS "${CMAKE_SHARED_LINKER_FLAGS} -fPIC")

add_executable(${PROJECT_NAME}
            main.cpp
            foo.cpp
            )

install(TARGETS ${PROJECT_NAME} DESTINATION bin)