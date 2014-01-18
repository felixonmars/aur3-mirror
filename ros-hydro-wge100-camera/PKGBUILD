
pkgdesc="ROS - A ROS node and assorted tools to provide access to the WGE100 camera used in the forearms and the stereo cameras of the PR2 robot."
url='http://www.ros.org/'

pkgname='ros-hydro-wge100-camera'
pkgver='1.8.2'
_pkgver_patch=0
arch=('i686' 'x86_64')
pkgrel=1
license=('GPL,BSD')
makedepends=('cmake' 'ros-build-tools')

ros_depends=(ros-hydro-message-generation
  ros-hydro-rospy
  ros-hydro-message-runtime
  ros-hydro-sensor-msgs
  ros-hydro-camera-calibration-parsers
  ros-hydro-driver-base
  ros-hydro-image-transport
  ros-hydro-roscpp
  ros-hydro-self-test
  ros-hydro-dynamic-reconfigure
  ros-hydro-diagnostic-updater
  ros-hydro-timestamp-tools
  ros-hydro-std-msgs
  ros-hydro-rostest)
depends=(${ros_depends[@]})

_tag=release/hydro/wge100_camera/${pkgver}-${_pkgver_patch}
_dir=wge100_camera
source=("${_dir}"::"git+https://github.com/ros-drivers-gbp/wge100_driver-release.git"#tag=${_tag})
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
