# Script generated with import_catkin_packages.py
# For more information: https://github.com/bchretien/arch-ros-stacks
pkgdesc="ROS - The motoman driver package includes nodes for interfacing with a motoman industrial robot controllers."
url='http://ros.org/wiki/motoman_driver'

pkgname='ros-hydro-motoman-driver'
pkgver='0.3.3'
_pkgver_patch=1
arch=('any')
pkgrel=2
license=('BSD')

ros_makedepends=(ros-hydro-industrial-msgs
  ros-hydro-trajectory-msgs
  ros-hydro-sensor-msgs
  ros-hydro-industrial-robot-client
  ros-hydro-roscpp
  ros-hydro-industrial-utils
  ros-hydro-catkin
  ros-hydro-std-msgs
  ros-hydro-actionlib
  ros-hydro-actionlib-msgs
  ros-hydro-urdf
  ros-hydro-simple-message
  ros-hydro-control-msgs)
makedepends=('cmake' 'git' 'ros-build-tools'
  ${ros_makedepends[@]})

ros_depends=(ros-hydro-industrial-msgs
  ros-hydro-trajectory-msgs
  ros-hydro-sensor-msgs
  ros-hydro-industrial-robot-client
  ros-hydro-roscpp
  ros-hydro-std-msgs
  ros-hydro-actionlib
  ros-hydro-actionlib-msgs
  ros-hydro-urdf
  ros-hydro-simple-message
  ros-hydro-control-msgs)
depends=(${ros_depends[@]})

_tag=release/hydro/motoman_driver/${pkgver}-${_pkgver_patch}
_dir=motoman_driver
source=("${_dir}"::"git+https://github.com/ros-industrial-release/motoman-release.git"#tag=${_tag})
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
