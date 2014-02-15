
pkgdesc="ROS - Some useful nodes for multi-robot teleoperation."
url='http://www.ros.org/'

pkgname='ros-hydro-mr-tools'
pkgver='0.2.6'
_pkgver_patch=1
arch=('i686' 'x86_64')
pkgrel=1
license=('MIT')

ros_makedepends=(ros-hydro-sensor-msgs
  ros-hydro-roscpp
  ros-hydro-geometry-msgs
  ros-hydro-catkin
  ros-hydro-nav-msgs
  ros-hydro-tf
  ros-hydro-std-msgs)
makedepends=('cmake' 'git' 'ros-build-tools'
  ${ros_makedepends[@]})

ros_depends=(ros-hydro-sensor-msgs
  ros-hydro-roscpp
  ros-hydro-geometry-msgs
  ros-hydro-nav-msgs
  ros-hydro-tf
  ros-hydro-std-msgs)
depends=(${ros_depends[@]})

_tag=release/hydro/mr_tools/${pkgver}-${_pkgver_patch}
_dir=mr_tools
source=("${_dir}"::"git+https://github.com/cogniteam/mr_teleoperator-release"#tag=${_tag})
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
