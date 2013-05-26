pkgdesc="ROS - a tool that assists in the creation of ROS filesystem resources."
url='http://www.ros.org/'

pkgname='ros-groovy-roscreate'
pkgver='1.9.45'
arch=('i686' 'x86_64')
pkgrel=1
license=('BSD')
makedepends=('ros-build-tools')

depends=(ros-groovy-catkin)

build() {
  [ -f /opt/ros/groovy/setup.bash ] && source /opt/ros/groovy/setup.bash
  if [ -d ${srcdir}/roscreate ]; then
    cd ${srcdir}/roscreate
    git fetch origin --tags
    git reset --hard release/groovy/roscreate/${pkgver}-0
  else
    git clone -b release/groovy/roscreate/${pkgver}-0 git://github.com/ros-gbp/ros-release.git ${srcdir}/roscreate
  fi
  [ -d ${srcdir}/build ] || mkdir ${srcdir}/build
  cd ${srcdir}/build
  /usr/share/ros-build-tools/fix-python-scripts.sh ${srcdir}/roscreate
  cmake ${srcdir}/roscreate -DCATKIN_BUILD_BINARY_PACKAGE=ON -DCMAKE_INSTALL_PREFIX=/opt/ros/groovy -DPYTHON_EXECUTABLE=/usr/bin/python2 -DPYTHON_INCLUDE_DIR=/usr/include/python2.7 -DPYTHON_LIBRARY=/usr/lib/libpython2.7.so -DSETUPTOOLS_DEB_LAYOUT=OFF
  make
}

package() {
  cd "${srcdir}/build"
  make DESTDIR="${pkgdir}/" install
}
