# Script generated with import_catkin_packages.py
# For more information: https://github.com/bchretien/arch-ros-stacks
pkgdesc="ROS - This package provides a node for higher level navigation of a mobile robot in a planar environment."
url='http://wiki.ros.org/robot_operator'

pkgname='ros-hydro-nav2d-navigator'
pkgver='0.1.2'
_pkgver_patch=0
arch=('any')
pkgrel=1
license=('GPLv3')

ros_makedepends=(ros-hydro-message-generation
  ros-hydro-actionlib-msgs
  ros-hydro-nav2d-msgs
  ros-hydro-roscpp
  ros-hydro-geometry-msgs
  ros-hydro-catkin
  ros-hydro-nav2d-operator
  ros-hydro-actionlib
  ros-hydro-tf
  ros-hydro-pluginlib)
makedepends=('cmake' 'git' 'ros-build-tools'
  ${ros_makedepends[@]})

ros_depends=(ros-hydro-actionlib-msgs
  ros-hydro-nav2d-msgs
  ros-hydro-message-runtime
  ros-hydro-roscpp
  ros-hydro-geometry-msgs
  ros-hydro-nav2d-operator
  ros-hydro-actionlib
  ros-hydro-tf
  ros-hydro-pluginlib)
depends=(${ros_depends[@]})

_tag=release/hydro/nav2d_navigator/${pkgver}-${_pkgver_patch}
_dir=nav2d_navigator
source=("${_dir}"::"git+https://github.com/skasperski/navigation_2d-release.git"#tag=${_tag})
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
  make -j1
}

package() {
  cd "${srcdir}/build"
  make DESTDIR="${pkgdir}/" install
}
