
pkgdesc="ROS - The pr2_gripper_action provides an action interface for using the gripper."
url='http://www.ros.org/'

pkgname='ros-hydro-pr2-gripper-action'
pkgver='1.10.7'
_pkgver_patch=0
arch=('i686' 'x86_64')
pkgrel=1
license=('BSD')
makedepends=('cmake' 'ros-build-tools')

ros_depends=(ros-hydro-pr2-controllers-msgs
  ros-hydro-pr2-mechanism-model
  ros-hydro-roscpp
  ros-hydro-pr2-mechanism-controllers
  ros-hydro-actionlib
  ros-hydro-robot-mechanism-controllers
  ros-hydro-actionlib-msgs)
depends=(${ros_depends[@]})

_tag=release/hydro/pr2_gripper_action/${pkgver}-${_pkgver_patch}
_dir=pr2_gripper_action
source=("${_dir}"::"git+https://github.com/ros-gbp/pr2_controllers-release.git"#tag=${_tag})
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
