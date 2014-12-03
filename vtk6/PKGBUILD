# Maintainer: eolianoe <eolianoe@gmail.com>
# Contributor: Andrzej Giniewicz <gginiu@gmail.com>
# Contributor: Thomas Dziedzic < gostrc at gmail >
# Contributor: Christofer Bertonha <christoferbertonha at gmail dot com>
# Contributor: leepesjee <lpeschier at xs4all dot nl>
# Contributor: Olivier Medoc
# Contributor: ignotus
# Contributor: Fabian Moser
# Contributor: djscholl
# Contributor: Christian Bühler <christian.buehler@ipoplan.de>

# Based on vtk PKGBUILD in community and on the debian package

pkgname=vtk6
pkgver=6.1.0
pkgrel=5
pkgdesc='A software system for 3D computer graphics, image processing, and visualization.'
arch=('i686' 'x86_64')
url='http://www.vtk.org/'
license=('BSD')
conflicts=('vtk')
provides=('vtk')
depends=('boost' 'ffmpeg' 'qt4' 'qtwebkit' 'lesstif' 'mariadb' 'gdal' 'unixodbc' 'openmpi')
makedepends=('cmake' 'java-environment' 'doxygen' 'gnuplot' 'python2' 'tk')
optdepends=('python2: python bindings'
            'java-environment: java bindings'
            'tk: tcl bindings'
            'gnuplot: plotting tools'
            'graphviz: drawing tools')
source=("http://www.vtk.org/files/release/${pkgver:0:3}/VTK-${pkgver}.tar.gz")
md5sums=('25e4dfb3bad778722dcaec80cd5dab7d')
options=('staticlibs')

prepare(){
  #Fix for Mesa 10.3.x
  sed -i 's/\/\/#define\ GLX_GLXEXT_LEGACY/#define\ GLX_GLXEXT_LEGACY/g' \
    ${srcdir}/VTK-${pkgver}/Rendering/OpenGL/vtkXOpenGLRenderWindow.cxx
}

build() {
  cd "${srcdir}"

  rm -rf build
  mkdir -p build
  cd build
  
  # flags to enable using system libs
  local cmake_system_flags=""
  for lib in HDF5 EXPAT FREETYPE JPEG PNG TIFF ZLIB LIBXML2 OGGTHEORA; do
    cmake_system_flags+="-DVTK_USE_SYSTEM_${lib}:BOOL=ON "
  done

  # flags to use python2 instead of python which is 3.x.x on archlinux
  local cmake_system_python_flags="-DPYTHON_EXECUTABLE:PATH=/usr/bin/python2 \
    -DPYTHON_INCLUDE_DIR:PATH=/usr/include/python2.7 \
    -DPYTHON_LIBRARY:PATH=/usr/lib/libpython2.7.so \
    -DVTK_INSTALL_PYTHON_MODULE_DIR=/usr/lib/python2.7/site-packages"

  # Qt4 flags
  local cmake_system_qt4_flags="-DQT_QMAKE_EXECUTABLE:FILEPATH=/usr/bin/qmake-qt4 \
    -DVTK_INSTALL_QT_PLUGIN_DIR:STRING=/usr/lib/qt4/plugins"

  # WRAP flags
  local cmake_wrap_flags=""
  for wrap in JAVA PYTHON TCL; do
    cmake_wrap_flags+="-DVTK_WRAP_${wrap}:BOOL=ON "
  done

  # USE flags
  local cmake_use_flags=""
  for use in FFMPEG_ENCODER X GCC_VISIBILITY ; do
    cmake_use_flags+="-DVTK_USE_${use}:BOOL=ON "
  done

  # export JAVA_HOME to help FindJava.cmake and FindJNI.cmake
  export JAVA_HOME=/usr/lib/jvm/default

  cmake "${srcdir}/VTK-$pkgver" \
    -Wno-dev \
    -DCMAKE_BUILD_TYPE:STRING=Release \
    -DCMAKE_INSTALL_PREFIX:FILEPATH=/usr \
    -DBUILD_SHARED_LIBS:BOOL=ON \
    -DBUILD_EXAMPLES:BOOL=ON \
    -DBUILD_DOCUMENTATION:BOOL=ON \
    -DDOCUMENTATION_HTML_HELP:BOOL=ON \
    -DDOCUMENTATION_HTML_TARZ:BOOL=ON \
    -DVTK_BUILD_ALL_MODULES:BOOL=ON \
    ${cmake_system_flags} \
    ${cmake_system_python_flags} \
    ${cmake_system_qt4_flags} \
    ${cmake_wrap_flags} \
    ${cmake_use_flags} 

  make
}

package() {
  cd "${srcdir}/build"

  make DESTDIR="${pkgdir}" install

  # Move the vtk.jar to the arch-specific location
  install -dv "${pkgdir}/usr/share/java/vtk"
  mv -v "${pkgdir}/usr/lib/vtk.jar" \
    "${pkgdir}/usr/share/java/vtk"
  rm -rf "${pkgdir}/usr/lib/vtk.jar"

  # Install license
  install -D ${srcdir}/VTK-$pkgver/Copyright.txt ${pkgdir}/usr/share/licenses/${pkgname}/Copyright.txt
}



