# Script generated with import_catkin_packages.py
# For more information: https://github.com/bchretien/arch-ros-stacks
pkgdesc="ROS - The nodelet package is designed to provide a way to run multiple algorithms in the same process with zero copy transport between algorithms."
url='http://ros.org/wiki/nodelet'

pkgname='ros-hydro-nodelet'
pkgver='1.8.4'
_pkgver_patch=0
arch=('any')
pkgrel=1
license=('BSD')

ros_makedepends=(ros-hydro-message-generation
  ros-hydro-rosconsole
  ros-hydro-rospy
  ros-hydro-roscpp
  ros-hydro-catkin
  ros-hydro-pluginlib
  ros-hydro-std-msgs
  ros-hydro-bondcpp)
makedepends=('cmake' 'git' 'ros-build-tools'
  ${ros_makedepends[@]}
  util-linux
  boost
  tinyxml)

ros_depends=(ros-hydro-rosconsole
  ros-hydro-message-runtime
  ros-hydro-roscpp
  ros-hydro-pluginlib
  ros-hydro-std-msgs
  ros-hydro-bondcpp)
depends=(${ros_depends[@]}
  util-linux
  boost
  tinyxml)

_tag=release/hydro/nodelet/${pkgver}-${_pkgver_patch}
_dir=nodelet
source=("${_dir}"::"git+https://github.com/ros-gbp/nodelet_core-release.git"#tag=${_tag})
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
