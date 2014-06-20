# Script generated with import_catkin_packages.py
# For more information: https://github.com/bchretien/arch-ros-stacks
pkgdesc="ROS - Follower for the turtlebot."
url='http://ros.org/wiki/turtlebot_apps'

pkgname='ros-hydro-turtlebot-follower'
pkgver='2.2.5'
_pkgver_patch=1
arch=('any')
pkgrel=2
license=('BSD')

ros_makedepends=(ros-hydro-turtlebot-msgs
  ros-hydro-nodelet
  ros-hydro-roscpp
  ros-hydro-catkin
  ros-hydro-visualization-msgs
  ros-hydro-dynamic-reconfigure
  ros-hydro-pcl-ros)
makedepends=('cmake' 'git' 'ros-build-tools'
  ${ros_makedepends[@]})

ros_depends=(ros-hydro-turtlebot-msgs
  ros-hydro-nodelet
  ros-hydro-roscpp
  ros-hydro-turtlebot-bringup
  ros-hydro-visualization-msgs
  ros-hydro-dynamic-reconfigure
  ros-hydro-pcl-ros)
depends=(${ros_depends[@]})

_tag=release/hydro/turtlebot_follower/${pkgver}-${_pkgver_patch}
_dir=turtlebot_follower
source=("${_dir}"::"git+https://github.com/turtlebot-release/turtlebot_apps-release.git"#tag=${_tag})
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
