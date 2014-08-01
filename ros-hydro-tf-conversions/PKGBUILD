# Script generated with import_catkin_packages.py
# For more information: https://github.com/bchretien/arch-ros-stacks
pkgdesc="ROS - This package contains a set of conversion functions to convert common tf datatypes (point, vector, pose, etc) into semantically identical datatypes used by other libraries."
url='http://www.ros.org/wiki/tf_conversions'

pkgname='ros-hydro-tf-conversions'
pkgver='1.10.8'
_pkgver_patch=1
arch=('any')
pkgrel=3
license=('BSD')

ros_makedepends=(ros-hydro-kdl-conversions
  ros-hydro-tf
  ros-hydro-geometry-msgs
  ros-hydro-catkin
  ros-hydro-orocos-kdl)
makedepends=('cmake' 'git' 'ros-build-tools'
  ${ros_makedepends[@]}
  eigen3)

ros_depends=(ros-hydro-kdl-conversions
  ros-hydro-python-orocos-kdl
  ros-hydro-geometry-msgs
  ros-hydro-tf
  ros-hydro-orocos-kdl)
depends=(${ros_depends[@]}
  eigen3)

_tag=release/hydro/tf_conversions/${pkgver}-${_pkgver_patch}
_dir=tf_conversions
source=("${_dir}"::"git+https://github.com/ros-gbp/geometry-release.git"#tag=${_tag})
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
