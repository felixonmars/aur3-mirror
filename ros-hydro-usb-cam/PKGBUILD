
pkgdesc="ROS - A generic driver for USB camera that are supported by V4L."
url='http://www.ros.org/'

pkgname='ros-hydro-usb-cam'
pkgver='0.1.3'
_pkgver_patch=0
arch=('i686' 'x86_64')
pkgrel=1
license=('BSD')

ros_makedepends=(ros-hydro-sensor-msgs
  ros-hydro-camera-info-manager
  ros-hydro-image-transport
  ros-hydro-roscpp
  ros-hydro-catkin
  ros-hydro-self-test
  ros-hydro-std-msgs)
makedepends=('cmake' 'git' 'ros-build-tools'
  ${ros_makedepends[@]}
  ffmpeg)

ros_depends=(ros-hydro-sensor-msgs
  ros-hydro-camera-info-manager
  ros-hydro-image-transport
  ros-hydro-roscpp
  ros-hydro-self-test
  ros-hydro-std-msgs)
depends=(${ros_depends[@]}
  ffmpeg)

_tag=release/hydro/usb_cam/${pkgver}-${_pkgver_patch}
_dir=usb_cam
source=("${_dir}"::"git+https://github.com/bosch-ros-pkg-release/usb_cam-release.git"#tag=${_tag}
        'ffmpeg.patch')
md5sums=('SKIP'
         '6c53b497072e46b2e3057b7763368ef8')

build() {
  # Use ROS environment variables
  /usr/share/ros-build-tools/clear-ros-env.sh
  [ -f /opt/ros/hydro/setup.bash ] && source /opt/ros/hydro/setup.bash

  # Apply patch
  msg "Patching source code"
  cd ${srcdir}/${_dir}
  git apply ${srcdir}/ffmpeg.patch

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
