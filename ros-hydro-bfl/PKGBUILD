
pkgdesc="ROS - This package contains a recent version of the Bayesian Filtering Library (BFL), distributed by the Orocos Project."
url='http://www.ros.org/'

pkgname='ros-hydro-bfl'
pkgver='0.7.0'
_pkgver_patch=3
arch=('i686' 'x86_64')
pkgrel=1
license=('LGPL')
makedepends=('cmake' 'ros-build-tools')

ros_depends=(ros-hydro-catkin)
depends=(${ros_depends[@]}
  boost
  cppunit)

_tag=release/hydro/bfl/${pkgver}-${_pkgver_patch}
_dir=bfl
source=("${_dir}"::"git+https://github.com/ros-gbp/bfl-release.git"#tag=${_tag})
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
