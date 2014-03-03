
pkgdesc="ROS - rosruby_tutorials contains source codes of rosruby tutorials."
url='http://www.ros.org/'

pkgname='ros-hydro-rosruby-tutorials'
pkgver='0.1.3'
_pkgver_patch=0
arch=('i686' 'x86_64')
pkgrel=1
license=('BSD')

ros_makedepends=(ros-hydro-message-generation
  ros-hydro-roscpp-tutorials
  ros-hydro-rosruby
  ros-hydro-geometry-msgs
  ros-hydro-catkin
  ros-hydro-std-msgs
  ros-hydro-genrb
  ros-hydro-actionlib-tutorials)
makedepends=('cmake' 'git' 'ros-build-tools'
  ${ros_makedepends[@]})

ros_depends=(ros-hydro-roscpp-tutorials
  ros-hydro-rosruby
  ros-hydro-message-runtime
  ros-hydro-rosruby-actionlib
  ros-hydro-geometry-msgs
  ros-hydro-std-msgs
  ros-hydro-actionlib-tutorials)
depends=(${ros_depends[@]})

_tag=release/hydro/rosruby_tutorials/${pkgver}-${_pkgver_patch}
_dir=rosruby_tutorials
source=("${_dir}"::"git+https://github.com/OTL/rosruby_common-release.git"#tag=${_tag})
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
