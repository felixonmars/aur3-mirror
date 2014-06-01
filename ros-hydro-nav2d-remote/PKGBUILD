# Script generated with import_catkin_packages.py
# For more information: https://github.com/bchretien/arch-ros-stacks
pkgdesc="ROS - This package is used to manually control a robot that uses the operator and navigator node from navigation_2d."
url='http://wiki.ros.org/remote_controller'

pkgname='ros-hydro-nav2d-remote'
pkgver='0.1.2'
_pkgver_patch=0
arch=('any')
pkgrel=1
license=('GPLv3')

ros_makedepends=(ros-hydro-nav2d-operator
  ros-hydro-roscpp
  ros-hydro-nav2d-navigator
  ros-hydro-catkin
  ros-hydro-sensor-msgs)
makedepends=('cmake' 'git' 'ros-build-tools'
  ${ros_makedepends[@]})

ros_depends=(ros-hydro-nav2d-operator
  ros-hydro-roscpp
  ros-hydro-nav2d-navigator
  ros-hydro-sensor-msgs)
depends=(${ros_depends[@]})

_tag=release/hydro/nav2d_remote/${pkgver}-${_pkgver_patch}
_dir=nav2d_remote
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
