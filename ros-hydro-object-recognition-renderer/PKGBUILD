# Script generated with import_catkin_packages.py
# For more information: https://github.com/bchretien/arch-ros-stacks
pkgdesc="ROS - Code that generates random views of an object."
url='http://ecto.willowgarage.com/recognition'

pkgname='ros-hydro-object-recognition-renderer'
pkgver='0.2.0'
_pkgver_patch=0
arch=('any')
pkgrel=1
license=('BSD>')

ros_makedepends=(ros-hydro-catkin
  ros-hydro-opencv2)
makedepends=('cmake' 'git' 'ros-build-tools'
  ${ros_makedepends[@]}
  devil
  freeimage
  libxi
  libxmu
  assimp
  boost
  sdl
  mesa
  freeglut)

ros_depends=(ros-hydro-opencv2)
depends=(${ros_depends[@]}
  devil
  freeimage
  libxi
  libxmu
  assimp
  boost
  sdl
  mesa
  freeglut)

_tag=release/hydro/object_recognition_renderer/${pkgver}-${_pkgver_patch}
_dir=object_recognition_renderer
source=("${_dir}"::"git+https://github.com/ros-gbp/object_recognition_renderer-release.git"#tag=${_tag})
md5sums=('SKIP')

build() {
  # Use ROS environment variables
  /usr/share/ros-build-tools/clear-ros-env.sh
  [ -f /opt/ros/hydro/setup.bash ] && source /opt/ros/hydro/setup.bash

  # Create build directory
  [ -d ${srcdir}/build ] || mkdir ${srcdir}/build
  cd ${srcdir}/build

  # Fix Python2/Python3 conflicts
  /usr/share/ros-build-tools/fix-python-scripts.sh ${srcdir}/${_dir}

  # Build project
  cmake ${srcdir}/${_dir} \
        -DCMAKE_BUILD_TYPE=Release \
        -DCATKIN_BUILD_BINARY_PACKAGE=ON \
        -DCMAKE_INSTALL_PREFIX=/opt/ros/hydro \
        -DPYTHON_EXECUTABLE=/usr/bin/python2 \
        -DPYTHON_INCLUDE_DIR=/usr/include/python2.7 \
        -DPYTHON_LIBRARY=/usr/lib/libpython2.7.so \
        -DSETUPTOOLS_DEB_LAYOUT=OFF
  make
}

package() {
  cd "${srcdir}/build"
  make DESTDIR="${pkgdir}/" install
}
