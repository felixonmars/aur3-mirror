pkgdesc='ROS - Mesh Conversion Utility'
url='http://www.ros.org/'

pkgname='ros-groovy-ivcon'
pkgver='0.1.4'
arch=('i686' 'x86_64')
pkgrel=1
license=('GPL')
makedepends=('ros-build-tools')

depends=(ros-groovy-catkin)

build() {
  [ -f /opt/ros/groovy/setup.bash ] && source /opt/ros/groovy/setup.bash
  if [ -d ${srcdir}/ivcon ]; then
    cd ${srcdir}/ivcon
    git fetch origin --tags
    git reset --hard release/ivcon/${pkgver}
  else
    git clone -b release/ivcon/${pkgver} git://github.com/ros-gbp/ivcon-release.git ${srcdir}/ivcon
  fi
  [ -d ${srcdir}/build ] || mkdir ${srcdir}/build
  cd ${srcdir}/build
  /usr/share/ros-build-tools/fix-python-scripts.sh ${srcdir}/ivcon
  cmake ${srcdir}/ivcon -DCATKIN_BUILD_BINARY_PACKAGE=ON -DCMAKE_INSTALL_PREFIX=/opt/ros/groovy -DPYTHON_EXECUTABLE=/usr/bin/python2 -DPYTHON_INCLUDE_DIR=/usr/include/python2.7 -DPYTHON_LIBRARY=/usr/lib/libpython2.7.so -DSETUPTOOLS_DEB_LAYOUT=OFF
  make
}

package() {
  cd "${srcdir}/build"
  make DESTDIR="${pkgdir}/" install
}
