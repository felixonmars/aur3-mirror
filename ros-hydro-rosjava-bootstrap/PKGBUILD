
pkgdesc="ROS - Bootstrap utilities for rosjava builds."
url='http://www.ros.org/'

pkgname='ros-hydro-rosjava-bootstrap'
pkgver='0.1.16'
_pkgver_patch=0
arch=('i686' 'x86_64')
pkgrel=1
license=('Apache 2.0')

ros_makedepends=(ros-hydro-rosjava-build-tools
  ros-hydro-catkin)
makedepends=('cmake' 'git' 'ros-build-tools'
  ${ros_makedepends[@]})

ros_depends=(ros-hydro-rosjava-build-tools)
depends=(${ros_depends[@]})

_tag=release/hydro/rosjava_bootstrap/${pkgver}-${_pkgver_patch}
_dir=rosjava_bootstrap
source=("${_dir}"::"git+https://github.com/rosjava-release/rosjava_bootstrap-release.git"#tag=${_tag})
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
