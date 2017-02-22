cmake_minimum_required(VERSION 3.5)
project(hello)

include(${CMAKE_BINARY_DIR}/conanbuildinfo.cmake)
conan_basic_setup()

enable_testing()
find_package(GTest REQUIRED)

add_library(static STATIC
  src/static/main/greeting.cpp)
target_include_directories(static PUBLIC src/static/main)

add_library(shared STATIC
  src/shared/main/add.cpp
  src/shared/main/multiply.cpp)
target_include_directories(shared PUBLIC src/shared/main)

add_executable(shared_gtest
  src/shared/gtest/add_test.cpp)
target_link_libraries(shared_gtest shared GTest::GTest GTest::Main)

add_test(all_tests bin/shared_gtest)

add_executable(executable src/executable/main/main.cpp)
target_link_libraries(executable static shared)

set_target_properties(
    static shared shared_gtest executable
    PROPERTIES CXX_STANDARD 14)
