
pkgdesc="ROS - A ROS driver node for AVT/Prosilica Gigabit Ethernet (GigE) cameras."
url='http://www.ros.org/'

pkgname='ros-hydro-prosilica-camera'
pkgver='1.9.3'
_pkgver_patch=0
arch=('i686' 'x86_64')
pkgrel=1
license=('BSD')
makedepends=('cmake' 'ros-build-tools')

ros_depends=(ros-hydro-polled-camera
  ros-hydro-prosilica-gige-sdk
  ros-hydro-rosconsole
  ros-hydro-sensor-msgs
  ros-hydro-camera-calibration-parsers
  ros-hydro-diagnostic-updater
  ros-hydro-image-transport
  ros-hydro-roscpp
  ros-hydro-self-test
  ros-hydro-dynamic-reconfigure
  ros-hydro-diagnostic-msgs
  ros-hydro-driver-base
  ros-hydro-std-msgs)
depends=(${ros_depends[@]})

_tag=release/hydro/prosilica_camera/${pkgver}-${_pkgver_patch}
_dir=prosilica_camera
source=("${_dir}"::"git+https://github.com/ros-drivers-gbp/prosilica_driver-release.git"#tag=${_tag})
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
