
# - Try to find SDSL
#
# The following variables are optionally searched for defaults
#  SDSL_ROOT_DIR:            Base directory where all GLOG components are found
#
# The following are set after configuration is done:
#  SDSL_FOUND
#  SDSL_INCLUDE_DIRS
#  SDSL_LIBRARIES

include(FindPackageHandleStandardArgs)

set(SDSL_ROOT_DIR "" CACHE PATH "Folder contains sdsl-lite")
set(SDSL_LOCAL_DIR "${CMAKE_BINARY_DIR}/external/sdsl")
set(SDSL_MIGRATION_DIR "${CMAKE_BINARY_DIR}/sdsl_external-prefix")

find_path(SDSL_INCLUDE_DIR sdsl/config.hpp
    PATHS ${SDSL_ROOT_DIR} ${SDSL_LOCAL_DIR} ${SDSL_MIGRATION_DIR}
    PATH_SUFFIXES include)

find_library(SDSL_LIBRARY sdsl
    PATHS ${SDSL_ROOT_DIR} ${SDSL_LOCAL_DIR} ${SDSL_MIGRATION_DIR}
    PATH_SUFFIXES lib)

find_package_handle_standard_args(Sdsl DEFAULT_MSG
    SDSL_INCLUDE_DIR SDSL_LIBRARY)

find_library(DIVSUFSORT_LIBRARY divsufsort
    PATHS ${SDSL_ROOT_DIR} ${SDSL_LOCAL_DIR} ${SDSL_MIGRATION_DIR}
    PATH_SUFFIXES lib)

find_package_handle_standard_args(Divsufsort DEFAULT_MSG
    DIVSUFSORT_LIBRARY)

find_library(DIVSUFSORT64_LIBRARY divsufsort64
    PATHS ${SDSL_ROOT_DIR} ${SDSL_LOCAL_DIR} ${SDSL_MIGRATION_DIR}
    PATH_SUFFIXES lib)

find_package_handle_standard_args(Divsufsort64 DEFAULT_MSG
    DIVSUFSORT64_LIBRARY)

if(SDSL_FOUND AND DIVSUFSORT_FOUND AND DIVSUFSORT64_FOUND)
    set(SDSL_INCLUDE_DIRS ${SDSL_INCLUDE_DIR})
    set(SDSL_LIBRARIES ${SDSL_LIBRARY} ${DIVSUFSORT_LIBRARY} ${DIVSUFSORT64_LIBRARY})
endif()
