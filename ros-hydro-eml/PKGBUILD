
pkgdesc="ROS - This is an implementation of the EtherCAT master protocol for the PR2 robot based on the work done at Flanders' Mechatronics Technology Centre."
url='http://www.ros.org/'

pkgname='ros-hydro-eml'
pkgver='0.36.0'
_pkgver_patch=3
arch=('i686' 'x86_64')
pkgrel=1
license=('Binary Only')
makedepends=('cmake' 'ros-build-tools')

ros_depends=(ros-hydro-catkin)
depends=(${ros_depends[@]})

_tag=release/hydro/eml/${pkgver}-${_pkgver_patch}
_dir=eml
source=("${_dir}"::"git+https://github.com/ros-gbp/eml-release.git"#tag=${_tag})
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
