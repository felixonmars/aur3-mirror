pkgdesc="ROS - converts laser scans to point clouds."
url='http://www.ros.org/'

pkgname='ros-groovy-laser-geometry'
pkgver='1.5.8'
arch=('i686' 'x86_64')
pkgrel=1
license=('BSD')
makedepends=('ros-build-tools')

depends=(ros-groovy-angles
  ros-groovy-roscpp
  ros-groovy-sensor-msgs
  ros-groovy-tf
  boost
  eigen3)

build() {
  [ -f /opt/ros/groovy/setup.bash ] && source /opt/ros/groovy/setup.bash
  if [ -d ${srcdir}/laser_geometry ]; then
    cd ${srcdir}/laser_geometry
    git fetch origin --tags
    git reset --hard release/laser_geometry/${pkgver}
  else
    git clone -b release/laser_geometry/${pkgver} git://github.com/ros-gbp/laser_geometry-release.git ${srcdir}/laser_geometry
  fi
  [ -d ${srcdir}/build ] || mkdir ${srcdir}/build
  cd ${srcdir}/build
  /usr/share/ros-build-tools/fix-python-scripts.sh ${srcdir}/laser_geometry
  cmake ${srcdir}/laser_geometry -DCATKIN_BUILD_BINARY_PACKAGE=ON -DCMAKE_INSTALL_PREFIX=/opt/ros/groovy -DPYTHON_EXECUTABLE=/usr/bin/python2 -DPYTHON_INCLUDE_DIR=/usr/include/python2.7 -DPYTHON_LIBRARY=/usr/lib/libpython2.7.so -DSETUPTOOLS_DEB_LAYOUT=OFF
  make
}

package() {
  cd "${srcdir}/build"
  make DESTDIR="${pkgdir}/" install
}
