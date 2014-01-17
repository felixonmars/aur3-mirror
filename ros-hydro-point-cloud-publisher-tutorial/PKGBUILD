
pkgdesc="ROS - The point_cloud_publisher_tutorial package."
url='http://www.ros.org/'

pkgname='ros-hydro-point-cloud-publisher-tutorial'
pkgver='0.2.0'
arch=('i686' 'x86_64')
pkgrel=1
license=('BSD')
makedepends=('cmake' 'ros-build-tools')

ros_depends=(ros-hydro-roscpp
  ros-hydro-sensor-msgs)
depends=(${ros_depends[@]})

_tag=release/hydro/point_cloud_publisher_tutorial/${pkgver}-0
_dir=point_cloud_publisher_tutorial
source=("${_dir}"::"git+https://github.com/ros-gbp/navigation_tutorials-release.git"#tag=${_tag})
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
