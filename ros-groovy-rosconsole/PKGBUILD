pkgdesc="ROS - console output library."
url='http://www.ros.org/'

pkgname='ros-groovy-rosconsole'
pkgver='1.9.50'
arch=('i686' 'x86_64')
pkgrel=1
license=('BSD')
makedepends=('ros-build-tools')

depends=(
  ros-groovy-rosunit
  ros-groovy-rostime
  ros-groovy-cpp-common
  ros-groovy-catkin
  log4cxx
)

build() {
  [ -f /opt/ros/groovy/setup.bash ] && source /opt/ros/groovy/setup.bash
  if [ -d ${srcdir}/rosconsole ]; then
    cd ${srcdir}/rosconsole
    git fetch origin --tags
    git reset --hard release/groovy/rosconsole/${pkgver}-0
  else
    git clone -b release/groovy/rosconsole/${pkgver}-0 git://github.com/ros-gbp/ros_comm-release.git ${srcdir}/rosconsole
  fi
  [ -d ${srcdir}/build ] || mkdir ${srcdir}/build
  cd ${srcdir}/build
  /usr/share/ros-build-tools/fix-python-scripts.sh ${srcdir}/rosconsole
  cmake ${srcdir}/rosconsole -DCATKIN_BUILD_BINARY_PACKAGE=ON -DCMAKE_INSTALL_PREFIX=/opt/ros/groovy -DPYTHON_EXECUTABLE=/usr/bin/python2 -DPYTHON_INCLUDE_DIR=/usr/include/python2.7 -DPYTHON_LIBRARY=/usr/lib/libpython2.7.so -DSETUPTOOLS_DEB_LAYOUT=OFF
  make
}

package() {
  cd "${srcdir}/build"
  make DESTDIR="${pkgdir}/" install
}
