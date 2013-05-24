pkgdesc="ROS - Conversion functions between: Eigen and KDL; Eigen and geometry_msgs."
url='http://www.ros.org/'

pkgname='ros-groovy-eigen-conversions'
pkgver='1.9.29'
arch=('i686' 'x86_64')
pkgrel=1
license=('BSD')
makedepends=('ros-build-tools')

depends=(ros-groovy-orocos-kdl
  ros-groovy-geometry-msgs
  ros-groovy-std-msgs
  eigen3)

build() {
  [ -f /opt/ros/groovy/setup.bash ] && source /opt/ros/groovy/setup.bash
  if [ -d ${srcdir}/eigen_conversions ]; then
    cd ${srcdir}/eigen_conversions
    git fetch origin --tags
    git reset --hard release/eigen_conversions/${pkgver}
  else
    git clone -b release/eigen_conversions/${pkgver} git://github.com/ros-gbp/geometry-release.git ${srcdir}/eigen_conversions
  fi
  [ -d ${srcdir}/build ] || mkdir ${srcdir}/build
  cd ${srcdir}/build
  /usr/share/ros-build-tools/fix-python-scripts.sh ${srcdir}/eigen_conversions
  cmake ${srcdir}/eigen_conversions -DCATKIN_BUILD_BINARY_PACKAGE=ON -DCMAKE_INSTALL_PREFIX=/opt/ros/groovy -DPYTHON_EXECUTABLE=/usr/bin/python2 -DPYTHON_INCLUDE_DIR=/usr/include/python2.7 -DPYTHON_LIBRARY=/usr/lib/libpython2.7.so -DSETUPTOOLS_DEB_LAYOUT=OFF
  make
}

package() {
  cd "${srcdir}/build"
  make DESTDIR="${pkgdir}/" install
}
