
pkgdesc="ROS - A driver for IMUs compatible the microstrain 3DM-GX2 and 3DM-GX3 protocol."
url='http://www.ros.org/'

pkgname='ros-hydro-microstrain-3dmgx2-imu'
pkgver='1.5.12'
_pkgver_patch=0
arch=('i686' 'x86_64')
pkgrel=1
license=('LGPL')
makedepends=('cmake' 'ros-build-tools')

ros_depends=(ros-hydro-message-generation
  ros-hydro-std-srvs
  ros-hydro-message-runtime
  ros-hydro-sensor-msgs
  ros-hydro-diagnostic-updater
  ros-hydro-roscpp
  ros-hydro-self-test
  ros-hydro-tf
  ros-hydro-std-msgs)
depends=(${ros_depends[@]}
  log4cxx)

_tag=release/hydro/microstrain_3dmgx2_imu/${pkgver}-${_pkgver_patch}
_dir=microstrain_3dmgx2_imu
source=("${_dir}"::"git+https://github.com/ros-gbp/microstrain_3dmgx2_imu-release.git"#tag=${_tag})
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
