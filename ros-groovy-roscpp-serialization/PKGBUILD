pkgdesc="ROS - code for serialization."
url='http://www.ros.org/'

pkgname='ros-groovy-roscpp-serialization'
pkgver='0.3.14'
arch=('i686' 'x86_64')
pkgrel=1
license=('BSD')
makedepends=('ros-build-tools')

depends=(ros-groovy-rostime
  ros-groovy-cpp-common
  ros-groovy-catkin
  ros-groovy-roscpp-traits)

build() {
  [ -f /opt/ros/groovy/setup.bash ] && source /opt/ros/groovy/setup.bash
  if [ -d ${srcdir}/roscpp_serialization ]; then
    cd ${srcdir}/roscpp_serialization
    git fetch origin --tags
    git reset --hard release/groovy/roscpp_serialization/${pkgver}-0
  else
    git clone -b release/groovy/roscpp_serialization/${pkgver}-0 git://github.com/ros-gbp/roscpp_core-release.git ${srcdir}/roscpp_serialization
  fi
  [ -d ${srcdir}/build ] || mkdir ${srcdir}/build
  cd ${srcdir}/build
  /usr/share/ros-build-tools/fix-python-scripts.sh ${srcdir}/roscpp_serialization
  cmake ${srcdir}/roscpp_serialization -DCATKIN_BUILD_BINARY_PACKAGE=ON -DCMAKE_INSTALL_PREFIX=/opt/ros/groovy -DPYTHON_EXECUTABLE=/usr/bin/python2 -DPYTHON_INCLUDE_DIR=/usr/include/python2.7 -DPYTHON_LIBRARY=/usr/lib/libpython2.7.so -DSETUPTOOLS_DEB_LAYOUT=OFF
  make
}

package() {
  cd "${srcdir}/build"
  make DESTDIR="${pkgdir}/" install
}
