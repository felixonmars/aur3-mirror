pkgdesc="ROS - Tools for directing, throttling, selecting, etc. with ROS topics at a meta level."
url='http://www.ros.org/'

pkgname='ros-groovy-topic-tools'
pkgver='1.9.50'
arch=('i686' 'x86_64')
pkgrel=1
license=('BSD')
makedepends=('ros-build-tools')

depends=(ros-groovy-roscpp
  ros-groovy-catkin
  ros-groovy-genmsg
  ros-groovy-rostime
  ros-groovy-rosconsole
  ros-groovy-rosunit
  ros-groovy-cpp-common
  ros-groovy-xmlrpcpp
  ros-groovy-rostest
  ros-groovy-langs-dev
  ros-groovy-langs)

build() {
  [ -f /opt/ros/groovy/setup.bash ] && source /opt/ros/groovy/setup.bash
  if [ -d ${srcdir}/topic_tools ]; then
    cd ${srcdir}/topic_tools
    git fetch origin --tags
    git reset --hard release/groovy/topic_tools/${pkgver}-0
  else
    git clone -b release/groovy/topic_tools/${pkgver}-0 git://github.com/ros-gbp/ros_comm-release.git ${srcdir}/topic_tools
  fi
  [ -d ${srcdir}/build ] || mkdir ${srcdir}/build
  cd ${srcdir}/build
  /usr/share/ros-build-tools/fix-python-scripts.sh ${srcdir}/topic_tools
  cmake ${srcdir}/topic_tools -DCATKIN_BUILD_BINARY_PACKAGE=ON -DCMAKE_INSTALL_PREFIX=/opt/ros/groovy -DPYTHON_EXECUTABLE=/usr/bin/python2 -DPYTHON_INCLUDE_DIR=/usr/include/python2.7 -DPYTHON_LIBRARY=/usr/lib/libpython2.7.so -DSETUPTOOLS_DEB_LAYOUT=OFF
  make
}

package() {
  cd "${srcdir}/build"
  make DESTDIR="${pkgdir}/" install
}
