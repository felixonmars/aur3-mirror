
pkgdesc="ROS - Face detection in images."
url='http://www.ros.org/'

pkgname='ros-hydro-face-detector'
pkgver='1.0.3'
_pkgver_patch=0
arch=('i686' 'x86_64')
pkgrel=1
license=('BSD')

ros_makedepends=(ros-hydro-message-generation
  ros-hydro-actionlib-msgs
  ros-hydro-actionlib
  ros-hydro-cv-bridge
  ros-hydro-sensor-msgs
  ros-hydro-people-msgs
  ros-hydro-rosbag
  ros-hydro-image-geometry
  ros-hydro-image-transport
  ros-hydro-roscpp
  ros-hydro-geometry-msgs
  ros-hydro-catkin
  ros-hydro-std-srvs
  ros-hydro-tf
  ros-hydro-stereo-msgs
  ros-hydro-std-msgs)
makedepends=('cmake' 'git' 'ros-build-tools'
  ${ros_makedepends[@]})

ros_depends=(ros-hydro-actionlib-msgs
  ros-hydro-actionlib
  ros-hydro-cv-bridge
  ros-hydro-message-runtime
  ros-hydro-sensor-msgs
  ros-hydro-people-msgs
  ros-hydro-rosbag
  ros-hydro-image-geometry
  ros-hydro-image-transport
  ros-hydro-roscpp
  ros-hydro-geometry-msgs
  ros-hydro-std-srvs
  ros-hydro-tf
  ros-hydro-stereo-msgs
  ros-hydro-std-msgs)
depends=(${ros_depends[@]})

_tag=release/hydro/face_detector/${pkgver}-${_pkgver_patch}
_dir=face_detector
source=("${_dir}"::"git+https://github.com/OSUrobotics/people-release.git"#tag=${_tag})
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
