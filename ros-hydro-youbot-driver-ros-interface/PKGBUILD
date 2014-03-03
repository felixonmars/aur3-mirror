
pkgdesc="ROS - ROS wrapper for the youBot driver."
url='http://www.ros.org/'

pkgname='ros-hydro-youbot-driver-ros-interface'
pkgver='1.0.0'
_pkgver_patch=2
arch=('i686' 'x86_64')
pkgrel=1
license=('LGPL, BSD')

ros_makedepends=(ros-hydro-brics-actuator
  ros-hydro-actionlib
  ros-hydro-youbot-driver
  ros-hydro-trajectory-msgs
  ros-hydro-roscpp
  ros-hydro-geometry-msgs
  ros-hydro-pr2-msgs
  ros-hydro-std-srvs
  ros-hydro-std-msgs
  ros-hydro-nav-msgs
  ros-hydro-tf
  ros-hydro-catkin
  ros-hydro-diagnostic-msgs
  ros-hydro-control-msgs
  ros-hydro-rosconsole)
makedepends=('cmake' 'git' 'ros-build-tools'
  ${ros_makedepends[@]})

ros_depends=(ros-hydro-brics-actuator
  ros-hydro-actionlib
  ros-hydro-youbot-driver
  ros-hydro-trajectory-msgs
  ros-hydro-roscpp
  ros-hydro-geometry-msgs
  ros-hydro-pr2-msgs
  ros-hydro-std-srvs
  ros-hydro-std-msgs
  ros-hydro-nav-msgs
  ros-hydro-tf
  ros-hydro-diagnostic-msgs
  ros-hydro-control-msgs
  ros-hydro-rosconsole)
depends=(${ros_depends[@]})

_tag=release/hydro/youbot_driver_ros_interface/${pkgver}-${_pkgver_patch}
_dir=youbot_driver_ros_interface
source=("${_dir}"::"git+https://github.com/youbot-release/youbot_driver_ros_interface-release.git"#tag=${_tag})
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
