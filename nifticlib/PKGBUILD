# Maintainer: Christian Tinauer <christian.tinauer@gmail.com>
pkgname=nifticlib
pkgver=2.0.0
pkgrel=4
pkgdesc='c library for reading nifti files'
arch=('i686' 'x86_64')
url='http://niftilib.sourceforge.net/'
license=('MIT')
depends=()
makedepends=('cmake')
source=('http://sourceforge.net/projects/niftilib/files/nifticlib/nifticlib_2_0_0/nifticlib-2.0.0.tar.gz')
md5sums=('425a711f8f92fb1e1f088cbc55bea53a')
options=(staticlibs)

build() {
  cd "$srcdir"

  mkdir -p build && cd build

  cmake \
    -D CMAKE_INSTALL_PREFIX:PATH=/usr \
    -D USE_FSL_CODE:BOOL=YES \
    ../start
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

  cd ../build
  make DESTDIR="$pkgdir/" install
}

prepare() {
  cd "$srcdir"
  mkdir -p start/configuration && cd start/configuration

  echo "# Build the configuration file for external projects using NIFTI and cmake
configure_file(
  NIFTIConfig.cmake.in
  \${NIFTI_BINARY_DIR}/NIFTIConfig.cmake
  @ONLY
)
install(
  FILES \${NIFTI_BINARY_DIR}/NIFTIConfig.cmake
  DESTINATION \${NIFTI_INSTALL_PACKAGE_DIR}
  COMPONENT Headers
)
configure_file(
  UseNIFTI.cmake.in
  \${NIFTI_BINARY_DIR}/UseNIFTI.cmake
  @ONLY
)
install(
  FILES \${NIFTI_BINARY_DIR}/UseNIFTI.cmake
  DESTINATION \${NIFTI_INSTALL_PACKAGE_DIR}
  COMPONENT Headers
)" > CMakeLists.txt

  echo "# The NIFTI source tree
get_filename_component(SELF_DIR \"\${CMAKE_CURRENT_LIST_FILE}\" PATH)

set(NIFTI_INCLUDE_DIRS \"@NIFTI_INSTALL_INCLUDE_DIR@\")
set(NIFTI_LIBRARY_DIRS \"@NIFTI_INSTALL_LIB_DIR@\")
set(NIFTI_USE_FILE \${SELF_DIR}/UseNIFTI.cmake)

# Backward compatible part
set(NIFTI_FOUND TRUE)" > NIFTIConfig.cmake.in

  echo "# This module is provided as NIFTI_USE_FILE by NIFTIConfig.cmake.
# It can be INCLUDEd in a project to load the needed compiler and linker
# settings to use NIFTI:
#   find_package(NIFTI REQUIRED)
#   include(\${NIFTI_USE_FILE})

if(NOT NIFTI_USE_FILE_INCLUDED)
  set(NIFTI_USE_FILE_INCLUDED 1)

  # Add include directories needed to use NIFTI.
  include_directories(\${NIFTI_INCLUDE_DIRS})

  # Add link directories needed to use NIFTI.
  link_directories(\${NIFTI_LIBRARY_DIRS})
endif()" > UseNIFTI.cmake.in

  cd ..

  echo "cmake_minimum_required(VERSION 2.8)

# Build nifti
add_subdirectory(../nifticlib-2.0.0 nifticlib)

# Get needed variables
get_directory_property(NIFTI_INSTALL_INCLUDE_DIR DIRECTORY ../nifticlib-2.0.0 DEFINITION NIFTI_INSTALL_INCLUDE_DIR)
get_directory_property(NIFTI_INSTALL_LIB_DIR     DIRECTORY ../nifticlib-2.0.0 DEFINITION NIFTI_INSTALL_LIB_DIR)

# Set needed variables
set(NIFTI_INSTALL_PACKAGE_DIR \${NIFTI_INSTALL_LIB_DIR}/nifticlib-2.0.0)

# Create config and use-file
add_subdirectory(configuration configuration)" > CMakeLists.txt
}

