pkgdesc="ROS - metapackage for various message generation stacks"
url='http://www.ros.org/'

pkgname='ros-groovy-message-generation'
pkgver='0.2.9'
arch=('i686' 'x86_64')
pkgrel=1
license=('BSD')
makedepends=('ros-build-tools')

depends=(
  ros-groovy-catkin
  ros-groovy-genlisp
  ros-groovy-gencpp
  ros-groovy-genpy
  ros-groovy-genmsg)

build() {
  [ -f /opt/ros/groovy/setup.bash ] && source /opt/ros/groovy/setup.bash
  if [ -d ${srcdir}/message_generation ]; then
    cd ${srcdir}/message_generation
    git fetch origin --tags
    git reset --hard release/message_generation/${pkgver}
  else
    git clone -b release/message_generation/${pkgver} git://github.com/ros-gbp/message_generation-release.git ${srcdir}/message_generation
  fi
  [ -d ${srcdir}/build ] || mkdir ${srcdir}/build
  cd ${srcdir}/build
  /usr/share/ros-build-tools/fix-python-scripts.sh ${srcdir}/message_generation
  cmake ${srcdir}/message_generation -DCATKIN_BUILD_BINARY_PACKAGE=ON -DCMAKE_INSTALL_PREFIX=/opt/ros/groovy -DPYTHON_EXECUTABLE=/usr/bin/python2 -DPYTHON_INCLUDE_DIR=/usr/include/python2.7 -DPYTHON_LIBRARY=/usr/lib/libpython2.7.so -DSETUPTOOLS_DEB_LAYOUT=OFF
  make
}

package() {
  cd "${srcdir}/build"
  make DESTDIR="${pkgdir}/" install
}
