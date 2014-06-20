# Script generated with import_catkin_packages.py
# For more information: https://github.com/bchretien/arch-ros-stacks
pkgdesc="ROS - Gazebo launchers and worlds for TurtleBot simulation."
url='http://ros.org/wiki/turtlebot_gazebo'

pkgname='ros-hydro-turtlebot-gazebo'
pkgver='2.1.1'
_pkgver_patch=1
arch=('any')
pkgrel=2
license=('BSD')

ros_makedepends=(ros-hydro-catkin)
makedepends=('cmake' 'git' 'ros-build-tools'
  ${ros_makedepends[@]})

ros_depends=(ros-hydro-depthimage-to-laserscan
  ros-hydro-xacro
  ros-hydro-robot-state-publisher
  ros-hydro-kobuki-gazebo-plugins
  ros-hydro-turtlebot-description
  ros-hydro-turtlebot-bringup
  ros-hydro-robot-pose-ekf
  ros-hydro-yocs-cmd-vel-mux
  ros-hydro-diagnostic-aggregator
  ros-hydro-gazebo-ros)
depends=(${ros_depends[@]})

# Note: create_gazebo_plugins was removed from the dependencies since
# it has not been fixed for Gazebo >= 2.

_tag=release/hydro/turtlebot_gazebo/${pkgver}-${_pkgver_patch}
_dir=turtlebot_gazebo
source=("${_dir}"::"git+https://github.com/turtlebot-release/turtlebot_simulator-release.git"#tag=${_tag})
md5sums=('SKIP')

build() {
  # Use ROS environment variables
  source /usr/share/ros-build-tools/clear-ros-env.sh
  [ -f /opt/ros/hydro/setup.bash ] && source /opt/ros/hydro/setup.bash

  # Create build directory
  [ -d ${srcdir}/build ] || mkdir ${srcdir}/build
  cd ${srcdir}/build

  # Fix Python2/Python3 conflicts
  /usr/share/ros-build-tools/fix-python-scripts.sh -v 2 ${srcdir}/${_dir}

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
