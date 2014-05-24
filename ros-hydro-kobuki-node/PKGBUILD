# Script generated with import_catkin_packages.py
# For more information: https://github.com/bchretien/arch-ros-stacks
pkgdesc="ROS - ROS nodelet for Kobuki: ROS wrapper for the Kobuki driver."
url='http://ros.org/wiki/kobuki_node'

pkgname='ros-hydro-kobuki-node'
pkgver='0.5.6'
_pkgver_patch=0
arch=('any')
pkgrel=1
license=('BSD')

ros_makedepends=(ros-hydro-ecl-streams
  ros-hydro-sensor-msgs
  ros-hydro-angles
  ros-hydro-ecl-exceptions
  ros-hydro-pluginlib
  ros-hydro-nodelet
  ros-hydro-diagnostic-updater
  ros-hydro-kobuki-safety-controller
  ros-hydro-geometry-msgs
  ros-hydro-nav-msgs
  ros-hydro-std-msgs
  ros-hydro-kobuki-keyop
  ros-hydro-roscpp
  ros-hydro-ecl-sigslots
  ros-hydro-diagnostic-msgs
  ros-hydro-ecl-threads
  ros-hydro-rospy
  ros-hydro-kobuki-driver
  ros-hydro-kobuki-ftdi
  ros-hydro-catkin
  ros-hydro-tf
  ros-hydro-kobuki-msgs)
makedepends=('cmake' 'git' 'ros-build-tools'
  ${ros_makedepends[@]})

ros_depends=(ros-hydro-ecl-streams
  ros-hydro-sensor-msgs
  ros-hydro-angles
  ros-hydro-rviz
  ros-hydro-diagnostic-aggregator
  ros-hydro-ecl-exceptions
  ros-hydro-pluginlib
  ros-hydro-nodelet
  ros-hydro-diagnostic-updater
  ros-hydro-kobuki-safety-controller
  ros-hydro-geometry-msgs
  ros-hydro-nav-msgs
  ros-hydro-std-msgs
  ros-hydro-kobuki-keyop
  ros-hydro-roscpp
  ros-hydro-ecl-sigslots
  ros-hydro-diagnostic-msgs
  ros-hydro-ecl-threads
  ros-hydro-rospy
  ros-hydro-kobuki-driver
  ros-hydro-kobuki-ftdi
  ros-hydro-tf
  ros-hydro-kobuki-msgs)
depends=(${ros_depends[@]})

_tag=release/hydro/kobuki_node/${pkgver}-${_pkgver_patch}
_dir=kobuki_node
source=("${_dir}"::"git+https://github.com/yujinrobot-release/kobuki-release.git"#tag=${_tag})
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
