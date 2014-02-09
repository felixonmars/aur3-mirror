project(curlcpp)
cmake_minimum_required(VERSION 2.8)

set(PROJECT_INCLUDE_DIR ${PROJECT_SOURCE_DIR}/include)
set(COMMON_SOURCE_DIR ${PROJECT_SOURCE_DIR}/src)

include_directories("${PROJECT_INCLUDE_DIR}")
include_directories("${PROJECT_SOURCE_DIR}")
include_directories("${COMMON_SOURCE_DIR}")

set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -std=c++11")

set(HEADERS
    ${PROJECT_INCLUDE_DIR}/abstract_curl.h
    ${PROJECT_INCLUDE_DIR}/curl_easy.h
    ${PROJECT_INCLUDE_DIR}/curl_header.h
    ${PROJECT_INCLUDE_DIR}/curl_http_post.h
    ${PROJECT_INCLUDE_DIR}/curl_multi.h
    ${PROJECT_INCLUDE_DIR}/easy_option_pair.h
    ${PROJECT_INCLUDE_DIR}/exceptions.h
    ${PROJECT_INCLUDE_DIR}/form_pair.h
    ${PROJECT_INCLUDE_DIR}/multi_message.h
    ${PROJECT_INCLUDE_DIR}/multi_option_pair.h
)

set(SOURCES
    ${COMMON_SOURCE_DIR}/abstract_curl.cpp
    ${COMMON_SOURCE_DIR}/curl_easy.cpp
    ${COMMON_SOURCE_DIR}/curl_header.cpp
    ${COMMON_SOURCE_DIR}/curl_http_post.cpp
    ${COMMON_SOURCE_DIR}/curl_multi.cpp
    ${COMMON_SOURCE_DIR}/curl_multi_message.cpp
)

add_library(curlcpp SHARED ${SOURCES} ${HEADERS})
target_link_libraries(curlcpp curl)

install(TARGETS curlcpp LIBRARY DESTINATION lib)
