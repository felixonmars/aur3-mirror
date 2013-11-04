pkgdesc="ROS - Time and Duration implementations for C++ libraries, including roscpp."
url='http://www.ros.org/'

pkgname='ros-groovy-rostime'
pkgver='0.3.16'
arch=('i686' 'x86_64')
pkgrel=1
license=('BSD')
makedepends=('ros-build-tools')

depends=(
  ros-groovy-cpp-common
  ros-groovy-catkin
  boost)

build() {
  [ -f /opt/ros/groovy/setup.bash ] && source /opt/ros/groovy/setup.bash
  if [ -d ${srcdir}/rostime ]; then
    cd ${srcdir}/rostime
    git fetch origin --tags
    git reset --hard release/groovy/rostime/${pkgver}-0
  else
    git clone -b release/groovy/rostime/${pkgver}-0 git://github.com/ros-gbp/roscpp_core-release.git ${srcdir}/rostime
  fi
  [ -d ${srcdir}/build ] || mkdir ${srcdir}/build
  cd ${srcdir}/build
  /usr/share/ros-build-tools/fix-python-scripts.sh ${srcdir}/rostime
  cmake ${srcdir}/rostime -DCATKIN_BUILD_BINARY_PACKAGE=ON -DCMAKE_INSTALL_PREFIX=/opt/ros/groovy -DPYTHON_EXECUTABLE=/usr/bin/python2 -DPYTHON_INCLUDE_DIR=/usr/include/python2.7 -DPYTHON_LIBRARY=/usr/lib/libpython2.7.so -DSETUPTOOLS_DEB_LAYOUT=OFF
  make
}

package() {
  cd "${srcdir}/build"
  make DESTDIR="${pkgdir}/" install
}
