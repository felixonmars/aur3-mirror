
pkgdesc="ROS - Useful math functions using Eigen."
url='http://www.ros.org/'

pkgname='ros-hydro-eigen-utils'
pkgver='1.0.2'
arch=('i686' 'x86_64')
pkgrel=1
license=('GPLv2')
makedepends=('cmake' 'ros-build-tools')

ros_depends=(ros-hydro-tf
  ros-hydro-tf-conversions
  ros-hydro-roscpp)
depends=(${ros_depends[@]}
  eigen3)

_tag=release/hydro/eigen_utils/${pkgver}-0
_dir=eigen_utils
source=("${_dir}"::"git+https://github.com/marioprats/eigen_utils-release.git"#tag=${_tag})
md5sums=('SKIP')

build() {
  # Use ROS environment variables
  /usr/share/ros-build-tools/clear-ros-env.sh
  [ -f /opt/ros/hydro/setup.bash ] && source /opt/ros/hydro/setup.bash

  # Create build directory
  [ -d ${srcdir}/build ] || mkdir ${srcdir}/build
  cd ${srcdir}/build

  # Fix Python3 error
  /usr/share/ros-build-tools/fix-python-scripts.sh ${srcdir}/${_dir}

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
