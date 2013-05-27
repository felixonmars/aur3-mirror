pkgdesc="ROS - A collection of .mk include files for building ROS architectural elements."
url='http://www.ros.org/'

pkgname='ros-groovy-mk'
pkgver='1.9.45'
arch=('i686' 'x86_64')
pkgrel=1
license=('BSD')
makedepends=('ros-build-tools')

depends=(ros-groovy-catkin)

build() {
  [ -f /opt/ros/groovy/setup.bash ] && source /opt/ros/groovy/setup.bash
  if [ -d ${srcdir}/mk ]; then
    cd ${srcdir}/mk
    git fetch origin --tags
    git reset --hard release/groovy/mk/${pkgver}-0
  else
    git clone -b release/groovy/mk/${pkgver}-0 git://github.com/ros-gbp/ros-release.git ${srcdir}/mk
  fi
  [ -d ${srcdir}/build ] || mkdir ${srcdir}/build
  cd ${srcdir}/build
  /usr/share/ros-build-tools/fix-python-scripts.sh ${srcdir}/mk
  cmake ${srcdir}/mk -DCATKIN_BUILD_BINARY_PACKAGE=ON -DCMAKE_INSTALL_PREFIX=/opt/ros/groovy -DPYTHON_EXECUTABLE=/usr/bin/python2 -DPYTHON_INCLUDE_DIR=/usr/include/python2.7 -DPYTHON_LIBRARY=/usr/lib/libpython2.7.so -DSETUPTOOLS_DEB_LAYOUT=OFF
  make
}

package() {
  cd "${srcdir}/build"
  make DESTDIR="${pkgdir}/" install
}
