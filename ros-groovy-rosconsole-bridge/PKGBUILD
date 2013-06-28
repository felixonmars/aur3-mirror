pkgdesc="ROS - Macro definition for console-bridge to rosconsole."
url='http://www.ros.org/'

pkgname='ros-groovy-rosconsole-bridge'
pkgver='0.2.7'
arch=('i686' 'x86_64')
pkgrel=1
license=('BSD')
makedepends=('ros-build-tools')

depends=(ros-groovy-console-bridge
  ros-groovy-catkin
  ros-groovy-rosconsole)

build() {
  [ -f /opt/ros/groovy/setup.bash ] && source /opt/ros/groovy/setup.bash
  if [ -d ${srcdir}/rosconsole_bridge ]; then
    cd ${srcdir}/rosconsole_bridge
    git fetch origin --tags
    git reset --hard release/groovy/rosconsole_bridge/${pkgver}-0
  else
    git clone -b release/groovy/rosconsole_bridge/${pkgver}-0 git://github.com/ros-gbp/rosconsole_bridge-release.git ${srcdir}/rosconsole_bridge
  fi
  [ -d ${srcdir}/build ] || mkdir ${srcdir}/build
  cd ${srcdir}/build
  /usr/share/ros-build-tools/fix-python-scripts.sh ${srcdir}/rosconsole_bridge
  cmake ${srcdir}/rosconsole_bridge -DCATKIN_BUILD_BINARY_PACKAGE=ON -DCMAKE_INSTALL_PREFIX=/opt/ros/groovy -DPYTHON_EXECUTABLE=/usr/bin/python2 -DPYTHON_INCLUDE_DIR=/usr/include/python2.7 -DPYTHON_LIBRARY=/usr/lib/libpython2.7.so -DSETUPTOOLS_DEB_LAYOUT=OFF
  make
}

package() {
  cd "${srcdir}/build"
  make DESTDIR="${pkgdir}/" install
}
