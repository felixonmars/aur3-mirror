# Script generated with import_catkin_packages.py
# For more information: https://github.com/bchretien/arch-ros-stacks
pkgdesc="ROS - The operator is a lightweight, purely reactive obstacle-avoidance module for mobile robots moving in a planar environment."
url='http://wiki.ros.org/nav2d_operator'

pkgname='ros-hydro-nav2d-operator'
pkgver='0.1.2'
_pkgver_patch=0
arch=('any')
pkgrel=1
license=('GPLv3')

ros_makedepends=(ros-hydro-message-generation
  ros-hydro-costmap-2d
  ros-hydro-sensor-msgs
  ros-hydro-roscpp
  ros-hydro-catkin
  ros-hydro-tf)
makedepends=('cmake' 'git' 'ros-build-tools'
  ${ros_makedepends[@]})

ros_depends=(ros-hydro-tf
  ros-hydro-roscpp
  ros-hydro-sensor-msgs
  ros-hydro-costmap-2d
  ros-hydro-message-runtime)
depends=(${ros_depends[@]})

_tag=release/hydro/nav2d_operator/${pkgver}-${_pkgver_patch}
_dir=nav2d_operator
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
  make
}

package() {
  cd "${srcdir}/build"
  make DESTDIR="${pkgdir}/" install
}
