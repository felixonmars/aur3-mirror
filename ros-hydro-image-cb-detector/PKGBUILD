# Script generated with import_catkin_packages.py
# For more information: https://github.com/bchretien/arch-ros-stacks
pkgdesc="ROS - Provide a node that extracts checkerboard corners from ROS images."
url='http://ros.org/wiki/image_cb_detector'

pkgname='ros-hydro-image-cb-detector'
pkgver='0.10.10'
_pkgver_patch=0
arch=('any')
pkgrel=1
license=('BSD')

ros_makedepends=(ros-hydro-message-generation
  ros-hydro-message-filters
  ros-hydro-cv-bridge
  ros-hydro-sensor-msgs
  ros-hydro-image-transport
  ros-hydro-roscpp
  ros-hydro-geometry-msgs
  ros-hydro-catkin
  ros-hydro-actionlib
  ros-hydro-calibration-msgs
  ros-hydro-actionlib-msgs
  ros-hydro-std-msgs)
makedepends=('cmake' 'git' 'ros-build-tools'
  ${ros_makedepends[@]})

ros_depends=(ros-hydro-message-filters
  ros-hydro-cv-bridge
  ros-hydro-message-runtime
  ros-hydro-sensor-msgs
  ros-hydro-image-transport
  ros-hydro-roscpp
  ros-hydro-geometry-msgs
  ros-hydro-actionlib
  ros-hydro-calibration-msgs
  ros-hydro-actionlib-msgs
  ros-hydro-std-msgs)
depends=(${ros_depends[@]})

_tag=release/hydro/image_cb_detector/${pkgver}-${_pkgver_patch}
_dir=image_cb_detector
source=("${_dir}"::"git+https://github.com/ros-gbp/calibration-release.git"#tag=${_tag})
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
