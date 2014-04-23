# Script generated with import_catkin_packages.py
# For more information: https://github.com/bchretien/arch-ros-stacks
pkgdesc="ROS - Example qt programs, generated from code similar to that used by the roscreate-qt-pkg script and styled on roscpp_tutorials."
url='http://www.ros.org/'

pkgname='ros-hydro-qt-tutorials'
pkgver='0.2.5'
_pkgver_patch=0
arch=('any')
pkgrel=1
license=('BSD')

ros_makedepends=(ros-hydro-qt-build
  ros-hydro-roscpp
  ros-hydro-message-generation
  ros-hydro-catkin
  ros-hydro-std-msgs)
makedepends=('cmake' 'git' 'ros-build-tools'
  ${ros_makedepends[@]}
  qt4)

ros_depends=(ros-hydro-qt-build
  ros-hydro-message-runtime
  ros-hydro-std-msgs
  ros-hydro-roscpp)
depends=(${ros_depends[@]}
  qt4)

_tag=release/hydro/qt_tutorials/${pkgver}-${_pkgver_patch}
_dir=qt_tutorials
source=("${_dir}"::"git+https://github.com/yujinrobot-release/qt_ros-release.git"#tag=${_tag})
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
