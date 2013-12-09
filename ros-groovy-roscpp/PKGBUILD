pkgdesc="ROS - C++ implementation of ROS."
url='http://www.ros.org/'

pkgname='ros-groovy-roscpp'
pkgver='1.9.50'
arch=('i686' 'x86_64')
pkgrel=2
license=('BSD')
makedepends=('ros-build-tools')

depends=(ros-groovy-xmlrpcpp
  ros-groovy-catkin
  ros-groovy-genmsg
  ros-groovy-roscpp-serialization
  ros-groovy-rostime
  ros-groovy-rosconsole
  ros-groovy-rosunit
  ros-groovy-cpp-common
  ros-groovy-roscpp-traits
  ros-groovy-std-msgs
  ros-groovy-langs-dev
  ros-groovy-langs
  ros-groovy-roslang
  ros-groovy-rosgraph-msgs
  pkg-config)

build() {
  [ -f /opt/ros/groovy/setup.bash ] && source /opt/ros/groovy/setup.bash
  if [ -d ${srcdir}/roscpp ]; then
    cd ${srcdir}/roscpp
    git fetch origin --tags
    git reset --hard release/groovy/roscpp/${pkgver}-0
  else
    git clone -b release/groovy/roscpp/${pkgver}-0 git://github.com/ros-gbp/ros_comm-release.git ${srcdir}/roscpp
  fi
  [ -d ${srcdir}/build ] || mkdir ${srcdir}/build
  cd ${srcdir}/build
  /usr/share/ros-build-tools/fix-python-scripts.sh ${srcdir}/roscpp
  cmake ${srcdir}/roscpp -DCATKIN_BUILD_BINARY_PACKAGE=ON -DCMAKE_INSTALL_PREFIX=/opt/ros/groovy -DPYTHON_EXECUTABLE=/usr/bin/python2 -DPYTHON_INCLUDE_DIR=/usr/include/python2.7 -DPYTHON_LIBRARY=/usr/lib/libpython2.7.so -DSETUPTOOLS_DEB_LAYOUT=OFF
  make
}

package() {
  cd "${srcdir}/build"
  make DESTDIR="${pkgdir}/" install
}
