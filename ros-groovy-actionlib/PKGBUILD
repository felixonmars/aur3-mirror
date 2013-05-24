pkgdesc="ROS - actionlib stack."
url='http://www.ros.org/'

pkgname='ros-groovy-actionlib'
pkgver='1.9.11'
arch=('i686' 'x86_64')
pkgrel=1
license=('BSD')
makedepends=('ros-build-tools')

depends=(ros-groovy-roscpp
  ros-groovy-catkin
  ros-groovy-genmsg
  ros-groovy-rostime
  ros-groovy-rosconsole
  ros-groovy-rospy
  ros-groovy-cpp-common
  ros-groovy-roscpp-traits
  ros-groovy-rostest
  ros-groovy-langs-dev
  ros-groovy-langs
  ros-groovy-actionlib-msgs
  boost)

build() {
  [ -f /opt/ros/groovy/setup.bash ] && source /opt/ros/groovy/setup.bash
  if [ -d ${srcdir}/actionlib ]; then
    cd ${srcdir}/actionlib
    git fetch origin --tags
    git reset --hard release/actionlib/${pkgver}
  else
    git clone -b release/actionlib/${pkgver} git://github.com/ros-gbp/actionlib-release.git ${srcdir}/actionlib
  fi
  [ -d ${srcdir}/build ] || mkdir ${srcdir}/build
  cd ${srcdir}/build
  /usr/share/ros-build-tools/fix-python-scripts.sh ${srcdir}/actionlib
  cmake ${srcdir}/actionlib -DCATKIN_BUILD_BINARY_PACKAGE=ON -DCMAKE_INSTALL_PREFIX=/opt/ros/groovy -DPYTHON_EXECUTABLE=/usr/bin/python2 -DPYTHON_INCLUDE_DIR=/usr/include/python2.7 -DPYTHON_LIBRARY=/usr/lib/libpython2.7.so -DSETUPTOOLS_DEB_LAYOUT=OFF
  make
}

package() {
  cd "${srcdir}/build"
  make DESTDIR="${pkgdir}/" install
}
