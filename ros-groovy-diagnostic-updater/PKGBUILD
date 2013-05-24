pkgdesc="ROS - tools for easily updating diagnostics."
url='http://www.ros.org/'

pkgname='ros-groovy-diagnostic-updater'
pkgver='1.7.10'
arch=('i686' 'x86_64')
pkgrel=1
license=('BSD')
makedepends=('ros-build-tools')

depends=(ros-groovy-diagnostic-msgs
  ros-groovy-roscpp
  ros-groovy-rostest
  ros-groovy-std-msgs)

build() {
  [ -f /opt/ros/groovy/setup.bash ] && source /opt/ros/groovy/setup.bash
  if [ -d ${srcdir}/diagnostic_updater ]; then
    cd ${srcdir}/diagnostic_updater
    git fetch origin --tags
    git reset --hard release/diagnostic_updater/${pkgver}
  else
    git clone -b release/diagnostic_updater/${pkgver} git://github.com/ros-gbp/diagnostics-release.git ${srcdir}/diagnostic_updater
  fi
  [ -d ${srcdir}/build ] || mkdir ${srcdir}/build
  cd ${srcdir}/build
  /usr/share/ros-build-tools/fix-python-scripts.sh ${srcdir}/diagnostic_updater
  cmake ${srcdir}/diagnostic_updater -DCATKIN_BUILD_BINARY_PACKAGE=ON -DCMAKE_INSTALL_PREFIX=/opt/ros/groovy -DPYTHON_EXECUTABLE=/usr/bin/python2 -DPYTHON_INCLUDE_DIR=/usr/include/python2.7 -DPYTHON_LIBRARY=/usr/lib/libpython2.7.so -DSETUPTOOLS_DEB_LAYOUT=OFF
  make
}

package() {
  cd "${srcdir}/build"
  make DESTDIR="${pkgdir}/" install
}
