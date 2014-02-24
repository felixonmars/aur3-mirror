
pkgdesc="ROS - turtlesim is a tool made for teaching ROS and ROS packages."
url='http://www.ros.org/'

pkgname='ros-hydro-turtlesim'
pkgver='0.4.3'
_pkgver_patch=0
arch=('i686' 'x86_64')
pkgrel=1
license=('BSD')

ros_makedepends=(ros-hydro-message-generation
  ros-hydro-rosconsole
  ros-hydro-roscpp-serialization
  ros-hydro-roscpp
  ros-hydro-geometry-msgs
  ros-hydro-roslib
  ros-hydro-catkin
  ros-hydro-std-srvs
  ros-hydro-rostime
  ros-hydro-std-msgs)
makedepends=('cmake' 'git' 'ros-build-tools'
  ${ros_makedepends[@]}
  qt4)

ros_depends=(ros-hydro-rosconsole
  ros-hydro-message-runtime
  ros-hydro-roscpp-serialization
  ros-hydro-roscpp
  ros-hydro-geometry-msgs
  ros-hydro-roslib
  ros-hydro-std-srvs
  ros-hydro-rostime
  ros-hydro-std-msgs)
depends=(${ros_depends[@]}
  qt4)

_tag=release/hydro/turtlesim/${pkgver}-${_pkgver_patch}
_dir=turtlesim
source=("${_dir}"::"git+https://github.com/ros-gbp/ros_tutorials-release.git"#tag=${_tag})
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
