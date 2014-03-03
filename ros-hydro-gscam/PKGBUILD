
pkgdesc="ROS - A ROS camera driver that uses gstreamer to connect to devices such as webcams."
url='http://www.ros.org/'

pkgname='ros-hydro-gscam'
pkgver='0.1.3'
_pkgver_patch=0
arch=('i686' 'x86_64')
pkgrel=1
license=('BSD')

ros_makedepends=(ros-hydro-sensor-msgs
  ros-hydro-nodelet
  ros-hydro-camera-calibration-parsers
  ros-hydro-image-transport
  ros-hydro-roscpp
  ros-hydro-opencv2
  ros-hydro-catkin
  ros-hydro-camera-info-manager)
makedepends=('cmake' 'git' 'ros-build-tools'
  ${ros_makedepends[@]}
  gstreamer0.10-base-plugins
  gstreamer0.10)

ros_depends=(ros-hydro-sensor-msgs
  ros-hydro-nodelet
  ros-hydro-camera-calibration-parsers
  ros-hydro-image-transport
  ros-hydro-roscpp
  ros-hydro-opencv2
  ros-hydro-camera-info-manager)
depends=(${ros_depends[@]})

_tag=release/hydro/gscam/${pkgver}-${_pkgver_patch}
_dir=gscam
source=("${_dir}"::"git+https://github.com/ros-drivers-gbp/gscam-release.git"#tag=${_tag})
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
