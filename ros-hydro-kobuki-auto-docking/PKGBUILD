# Script generated with import_catkin_packages.py
# For more information: https://github.com/bchretien/arch-ros-stacks
pkgdesc="ROS - Automatic docking for Kobuki: Users owning a docking station for Kobuki can use this tool to let Kobuki find its nest autonomously."
url='http://ros.org/wiki/kobuki_auto_docking'

pkgname='ros-hydro-kobuki-auto-docking'
pkgver='0.5.6'
_pkgver_patch=0
arch=('any')
pkgrel=1
license=('BSD')

ros_makedepends=(ros-hydro-kdl-conversions
  ros-hydro-kobuki-dock-drive
  ros-hydro-message-filters
  ros-hydro-nav-msgs
  ros-hydro-ecl-threads
  ros-hydro-rospy
  ros-hydro-nodelet
  ros-hydro-roscpp
  ros-hydro-geometry-msgs
  ros-hydro-catkin
  ros-hydro-actionlib
  ros-hydro-ecl-linear-algebra
  ros-hydro-actionlib-msgs
  ros-hydro-kobuki-msgs
  ros-hydro-ecl-geometry
  ros-hydro-std-msgs
  ros-hydro-pluginlib)
makedepends=('cmake' 'git' 'ros-build-tools'
  ${ros_makedepends[@]})

ros_depends=(ros-hydro-kdl-conversions
  ros-hydro-kobuki-dock-drive
  ros-hydro-message-filters
  ros-hydro-nav-msgs
  ros-hydro-ecl-threads
  ros-hydro-rospy
  ros-hydro-nodelet
  ros-hydro-roscpp
  ros-hydro-geometry-msgs
  ros-hydro-actionlib
  ros-hydro-ecl-linear-algebra
  ros-hydro-actionlib-msgs
  ros-hydro-yocs-cmd-vel-mux
  ros-hydro-kobuki-msgs
  ros-hydro-ecl-geometry
  ros-hydro-std-msgs
  ros-hydro-pluginlib)
depends=(${ros_depends[@]})

_tag=release/hydro/kobuki_auto_docking/${pkgver}-${_pkgver_patch}
_dir=kobuki_auto_docking
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
