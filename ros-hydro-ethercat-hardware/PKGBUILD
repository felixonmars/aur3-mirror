
pkgdesc="ROS - Package for creating a hardware interface to the robot using the EtherCAT motor controller/driver."
url='http://www.ros.org/'

pkgname='ros-hydro-ethercat-hardware'
pkgver='1.8.7'
_pkgver_patch=0
arch=('i686' 'x86_64')
pkgrel=1
license=('BSD')
makedepends=('cmake' 'ros-build-tools')

ros_depends=(ros-hydro-message-generation
  ros-hydro-pr2-msgs
  ros-hydro-pr2-hardware-interface
  ros-hydro-message-runtime
  ros-hydro-realtime-tools
  ros-hydro-roscpp
  ros-hydro-diagnostic-updater
  ros-hydro-eml
  ros-hydro-diagnostic-msgs
  ros-hydro-pluginlib)
depends=(${ros_depends[@]}
  log4cxx)

_tag=release/hydro/ethercat_hardware/${pkgver}-${_pkgver_patch}
_dir=ethercat_hardware
source=("${_dir}"::"git+https://github.com/ros-gbp/pr2_ethercat_drivers-release.git"#tag=${_tag}
        "boost.patch")
md5sums=('SKIP'
         'a0292a22d1cd8d15c103e2d2982d81c9')

build() {
  # Use ROS environment variables
  /usr/share/ros-build-tools/clear-ros-env.sh
  [ -f /opt/ros/hydro/setup.bash ] && source /opt/ros/hydro/setup.bash

  # Apply patch
  msg "Patching source code"
  cd ${srcdir}/${_dir}
  git apply ${srcdir}/boost.patch

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
