
pkgdesc="ROS - Controllers to operate the digital output of the motor controller boards and the projector board."
url='http://www.ros.org/'

pkgname='ros-hydro-ethercat-trigger-controllers'
pkgver='1.10.8'
_pkgver_patch=0
arch=('i686' 'x86_64')
pkgrel=1
license=('BSD')

ros_makedepends=(ros-hydro-message-generation
  ros-hydro-realtime-tools
  ros-hydro-roscpp
  ros-hydro-catkin
  ros-hydro-pr2-controller-interface
  ros-hydro-diagnostic-msgs
  ros-hydro-std-msgs
  ros-hydro-pluginlib)
makedepends=('cmake' 'git' 'ros-build-tools'
  ${ros_makedepends[@]}
  libtool)

ros_depends=(ros-hydro-rospy
  ros-hydro-message-runtime
  ros-hydro-realtime-tools
  ros-hydro-roscpp
  ros-hydro-pr2-controller-interface
  ros-hydro-diagnostic-msgs
  ros-hydro-std-msgs
  ros-hydro-pluginlib)
depends=(${ros_depends[@]}
  libtool)

_tag=release/hydro/ethercat_trigger_controllers/${pkgver}-${_pkgver_patch}
_dir=ethercat_trigger_controllers
source=("${_dir}"::"git+https://github.com/ros-gbp/pr2_controllers-release.git"#tag=${_tag})
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
