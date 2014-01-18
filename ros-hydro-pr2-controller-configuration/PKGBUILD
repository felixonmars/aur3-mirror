
pkgdesc="ROS - Configuration files for PR2 controllers."
url='http://www.ros.org/'

pkgname='ros-hydro-pr2-controller-configuration'
pkgver='1.6.6'
_pkgver_patch=0
arch=('i686' 'x86_64')
pkgrel=1
license=('BSD')
makedepends=('cmake' 'ros-build-tools')

ros_depends=(ros-hydro-pr2-head-action
  ros-hydro-roslaunch
  ros-hydro-pr2-gripper-action
  ros-hydro-pr2-machine
  ros-hydro-robot-mechanism-controllers
  ros-hydro-pr2-controller-manager
  ros-hydro-single-joint-position-action)
depends=(${ros_depends[@]})

_tag=release/hydro/pr2_controller_configuration/${pkgver}-${_pkgver_patch}
_dir=pr2_controller_configuration
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
