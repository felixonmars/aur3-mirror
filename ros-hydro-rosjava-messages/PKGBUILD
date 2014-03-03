
pkgdesc="ROS - Message generation for rosjava."
url='http://www.ros.org/'

pkgname='ros-hydro-rosjava-messages'
pkgver='0.1.63'
_pkgver_patch=0
arch=('i686' 'x86_64')
pkgrel=1
license=('Apache 2.0')

ros_makedepends=(ros-hydro-pcl-msgs
  ros-hydro-turtlesim
  ros-hydro-pr2-mechanism-msgs
  ros-hydro-costmap-2d
  ros-hydro-sr-ronex-msgs
  ros-hydro-um6
  ros-hydro-rosruby-messages
  ros-hydro-kobuki-testsuite
  ros-hydro-visualization-msgs
  ros-hydro-rosbridge-library
  ros-hydro-actionlib-tutorials
  ros-hydro-pr2-msgs
  ros-hydro-base-local-planner
  ros-hydro-rocon-service-pair-msgs
  ros-hydro-humanoid-nav-msgs
  ros-hydro-ethercat-trigger-controllers
  ros-hydro-pr2-mechanism-controllers
  ros-hydro-nmea-msgs
  ros-hydro-std-msgs
  ros-hydro-rtmbuild
  ros-hydro-rospy-message-converter
  ros-hydro-rosserial-msgs
  ros-hydro-sound-play
  ros-hydro-p2os-urdf
  ros-hydro-rocon-std-msgs
  ros-hydro-laser-assembler
  ros-hydro-roscpp
  ros-hydro-clearpath-base
  ros-hydro-hector-nav-msgs
  ros-hydro-wge100-camera
  ros-hydro-geographic-msgs
  ros-hydro-fingertip-pressure
  ros-hydro-gps-common
  ros-hydro-wifi-ddwrt
  ros-hydro-catkin
  ros-hydro-calibration-msgs
  ros-hydro-gazebo-plugins
  ros-hydro-pr2-controllers-msgs
  ros-hydro-move-base-msgs
  ros-hydro-control-toolbox
  ros-hydro-nodelet
  ros-hydro-rosapi
  ros-hydro-stereo-msgs
  ros-hydro-youbot-driver-ros-interface
  ros-hydro-rosruby-tutorials
  ros-hydro-shape-msgs
  ros-hydro-rosserial-arduino
  ros-hydro-industrial-msgs
  ros-hydro-moveit-msgs
  ros-hydro-driver-base
  ros-hydro-rospy-tutorials
  ros-hydro-control-msgs
  ros-hydro-actionlib
  ros-hydro-hector-mapping
  ros-hydro-sensor-msgs
  ros-hydro-audio-common-msgs
  ros-hydro-turtlebot-calibration
  ros-hydro-pr2-power-board
  ros-hydro-nao-msgs
  ros-hydro-scheduler-msgs
  ros-hydro-polled-camera
  ros-hydro-object-recognition-msgs
  ros-hydro-map-store
  ros-hydro-trajectory-msgs
  ros-hydro-segway-rmp
  ros-hydro-create-node
  ros-hydro-tf
  ros-hydro-rocon-app-manager-msgs
  ros-hydro-pano-ros
  ros-hydro-kingfisher-msgs
  ros-hydro-rosruby
  ros-hydro-yocs-msgs
  ros-hydro-r2-msgs
  ros-hydro-gazebo-msgs
  ros-hydro-tf2-msgs
  ros-hydro-map-msgs
  ros-hydro-multimaster-msgs-fkie
  ros-hydro-rosjava-bootstrap
  ros-hydro-dynamixel-controllers
  ros-hydro-manipulation-msgs
  ros-hydro-linux-hardware
  ros-hydro-wireless-msgs
  ros-hydro-qt-tutorials
  ros-hydro-turtle-actionlib
  ros-hydro-arbotix-msgs
  ros-hydro-hector-uav-msgs
  ros-hydro-std-srvs
  ros-hydro-blob
  ros-hydro-velodyne-msgs
  ros-hydro-roscpp-tutorials
  ros-hydro-octomap-msgs
  ros-hydro-ethercat-hardware
  ros-hydro-ar-track-alvar
  ros-hydro-kobuki-msgs
  ros-hydro-p2os-driver
  ros-hydro-move-base
  ros-hydro-microstrain-3dmgx2-imu
  ros-hydro-smach-msgs
  ros-hydro-uuid-msgs
  ros-hydro-rosjava-build-tools
  ros-hydro-rosgraph-msgs
  ros-hydro-shared-serial
  ros-hydro-controller-manager-msgs
  ros-hydro-theora-image-transport
  ros-hydro-dynamic-reconfigure
  ros-hydro-razer-hydra
  ros-hydro-rosauth
  ros-hydro-geometry-msgs
  ros-hydro-bond
  ros-hydro-nav-msgs
  ros-hydro-actionlib-msgs
  ros-hydro-topic-tools
  ros-hydro-gazebo-ros
  ros-hydro-turtlebot-msgs
  ros-hydro-brics-actuator
  ros-hydro-dynamixel-msgs
  ros-hydro-ackermann-msgs
  ros-hydro-cob-srvs
  ros-hydro-topic-proxy
  ros-hydro-p2os-teleop
  ros-hydro-hector-worldmodel-msgs
  ros-hydro-underwater-sensor-msgs
  ros-hydro-turtlebot-actions
  ros-hydro-cmvision
  ros-hydro-zeroconf-msgs
  ros-hydro-ecto-ros
  ros-hydro-gateway-msgs
  ros-hydro-image-cb-detector
  ros-hydro-grizzly-msgs
  ros-hydro-household-objects-database-msgs
  ros-hydro-diagnostic-msgs
  ros-hydro-roboteq-msgs
  ros-hydro-concert-msgs)
makedepends=('cmake' 'git' 'ros-build-tools'
  ${ros_makedepends[@]})

ros_depends=(ros-hydro-rosjava-bootstrap
  ros-hydro-rosjava-build-tools)
depends=(${ros_depends[@]})

_tag=release/hydro/rosjava_messages/${pkgver}-${_pkgver_patch}
_dir=rosjava_messages
source=("${_dir}"::"git+https://github.com/rosjava-release/rosjava_messages-release.git"#tag=${_tag})
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
