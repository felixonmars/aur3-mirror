pkgdesc="ROS - metapackage for various message runtime stacks"
url='http://www.ros.org/'

pkgname='ros-groovy-message-runtime'
pkgver='0.4.11'
arch=('i686' 'x86_64')
pkgrel=2
license=('BSD')
makedepends=('ros-build-tools')

depends=(
  ros-groovy-catkin
  ros-groovy-cpp-common
  ros-groovy-roscpp-serialization
  ros-groovy-roscpp-traits
  ros-groovy-rostime
  ros-groovy-genpy)

build() {
  [ -f /opt/ros/groovy/setup.bash ] && source /opt/ros/groovy/setup.bash
  if [ -d ${srcdir}/message_runtime ]; then
    cd ${srcdir}/message_runtime
    git fetch origin --tags
    git reset --hard release/message_runtime/${pkgver}
  else
    git clone -b release/message_runtime/${pkgver} git://github.com/ros-gbp/message_runtime-release.git ${srcdir}/message_runtime
  fi
  [ -d ${srcdir}/build ] || mkdir ${srcdir}/build
  cd ${srcdir}/build
  /usr/share/ros-build-tools/fix-python-scripts.sh ${srcdir}/message_runtime
  cmake ${srcdir}/message_runtime -DCATKIN_BUILD_BINARY_PACKAGE=ON -DCMAKE_INSTALL_PREFIX=/opt/ros/groovy -DPYTHON_EXECUTABLE=/usr/bin/python2 -DPYTHON_INCLUDE_DIR=/usr/include/python2.7 -DPYTHON_LIBRARY=/usr/lib/libpython2.7.so -DSETUPTOOLS_DEB_LAYOUT=OFF
  make
}

package() {
  cd "${srcdir}/build"
  make DESTDIR="${pkgdir}/" install
}
