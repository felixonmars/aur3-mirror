
pkgdesc="ROS -  The PR2 is equipped with a texture projector that can be used to project a texture onto featureless surfaces, allowing their three-dimensional structure to be determined using stereoscopy."
url='http://www.ros.org/'

pkgname='ros-hydro-pr2-camera-synchronizer'
pkgver='1.6.6'
_pkgver_patch=0
arch=('i686' 'x86_64')
pkgrel=1
license=('BSD')
makedepends=('cmake' 'ros-build-tools')

ros_depends=(ros-hydro-wge100-camera
  ros-hydro-rospy
  ros-hydro-ethercat-trigger-controllers
  ros-hydro-dynamic-reconfigure
  ros-hydro-diagnostic-msgs
  ros-hydro-rostest)
depends=(${ros_depends[@]})

_tag=release/hydro/pr2_camera_synchronizer/${pkgver}-${_pkgver_patch}
_dir=pr2_camera_synchronizer
source=("${_dir}"::"git+https://github.com/ros-gbp/pr2_robot-release.git"#tag=${_tag})
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
