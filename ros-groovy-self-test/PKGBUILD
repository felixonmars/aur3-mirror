pkgdesc="ROS - self_test"
url='http://www.ros.org/'

pkgname='ros-groovy-self-test'
pkgver='1.7.10'
arch=('i686' 'x86_64')
pkgrel=1
license=('BSD')
makedepends=('ros-build-tools')

depends=(ros-groovy-diagnostic-updater
  ros-groovy-diagnostic-msgs
  ros-groovy-roscpp
  ros-groovy-rostest)

build() {
  [ -f /opt/ros/groovy/setup.bash ] && source /opt/ros/groovy/setup.bash
  if [ -d ${srcdir}/self_test ]; then
    cd ${srcdir}/self_test
    git fetch origin --tags
    git reset --hard release/self_test/${pkgver}
  else
    git clone -b release/self_test/${pkgver} git://github.com/ros-gbp/diagnostics-release.git ${srcdir}/self_test
  fi
  [ -d ${srcdir}/build ] || mkdir ${srcdir}/build
  cd ${srcdir}/build
  /usr/share/ros-build-tools/fix-python-scripts.sh ${srcdir}/self_test
  cmake ${srcdir}/self_test -DCATKIN_BUILD_BINARY_PACKAGE=ON -DCMAKE_INSTALL_PREFIX=/opt/ros/groovy -DPYTHON_EXECUTABLE=/usr/bin/python2 -DPYTHON_INCLUDE_DIR=/usr/include/python2.7 -DPYTHON_LIBRARY=/usr/lib/libpython2.7.so -DSETUPTOOLS_DEB_LAYOUT=OFF
  make
}

package() {
  cd "${srcdir}/build"
  make DESTDIR="${pkgdir}/" install
}
