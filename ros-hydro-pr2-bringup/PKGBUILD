
pkgdesc="ROS - Launch files and scripts needed to bring a PR2 up into a running state."
url='http://www.ros.org/'

pkgname='ros-hydro-pr2-bringup'
pkgver='1.6.6'
_pkgver_patch=0
arch=('i686' 'x86_64')
pkgrel=1
license=('BSD')
makedepends=('cmake' 'ros-build-tools')

ros_depends=(ros-hydro-microstrain-3dmgx2-imu
  ros-hydro-hokuyo-node
  ros-hydro-joint-trajectory-action
  ros-hydro-robot-mechanism-controllers
  ros-hydro-pr2-dashboard-aggregator
  ros-hydro-pr2-gripper-action
  ros-hydro-pr2-calibration-controllers
  ros-hydro-pr2-ethercat
  ros-hydro-diagnostic-aggregator
  ros-hydro-pr2-power-board
  ros-hydro-pr2-camera-synchronizer
  ros-hydro-ethercat-trigger-controllers
  ros-hydro-pr2-description
  ros-hydro-pr2-run-stop-auto-restart
  ros-hydro-joy
  ros-hydro-sound-play
  ros-hydro-stereo-image-proc
  ros-hydro-rosbag
  ros-hydro-tf2-ros
  ros-hydro-robot-state-publisher
  ros-hydro-power-monitor
  ros-hydro-std-srvs
  ros-hydro-pr2-controller-manager
  ros-hydro-single-joint-position-action
  ros-hydro-pr2-head-action
  ros-hydro-wge100-camera
  ros-hydro-pr2-machine
  ros-hydro-prosilica-camera
  ros-hydro-wifi-ddwrt
  ros-hydro-ocean-battery-driver
  ros-hydro-robot-pose-ekf
  ros-hydro-pr2-computer-monitor
  ros-hydro-pr2-controller-configuration
  ros-hydro-rostest)
depends=(${ros_depends[@]})

_tag=release/hydro/pr2_bringup/${pkgver}-${_pkgver_patch}
_dir=pr2_bringup
source=("${_dir}"::"git+https://github.com/ros-gbp/pr2_robot-release.git"#tag=${_tag})
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
