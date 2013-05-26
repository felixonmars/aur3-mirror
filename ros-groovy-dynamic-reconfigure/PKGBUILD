pkgdesc="ROS - provides a means to change node parameters."
url='http://www.ros.org/'

pkgname='ros-groovy-dynamic-reconfigure'
pkgver='1.5.32'
arch=('i686' 'x86_64')
pkgrel=1
license=('BSD')
makedepends=('ros-build-tools')

depends=(ros-groovy-roscpp
  ros-groovy-catkin
  ros-groovy-genmsg
  ros-groovy-roslib
  ros-groovy-rospy
  ros-groovy-std-msgs
  ros-groovy-langs-dev
  ros-groovy-rosservice
  boost)

build() {
  [ -f /opt/ros/groovy/setup.bash ] && source /opt/ros/groovy/setup.bash
  if [ -d ${srcdir}/dynamic_reconfigure ]; then
    cd ${srcdir}/dynamic_reconfigure
    git fetch origin --tags
    git reset --hard release/groovy/dynamic_reconfigure/${pkgver}-0
  else
    git clone -b release/groovy/dynamic_reconfigure/${pkgver}-0 git://github.com/ros-gbp/dynamic_reconfigure-release.git ${srcdir}/dynamic_reconfigure
  fi
  [ -d ${srcdir}/build ] || mkdir ${srcdir}/build
  cd ${srcdir}/build
  /usr/share/ros-build-tools/fix-python-scripts.sh ${srcdir}/dynamic_reconfigure
  cmake ${srcdir}/dynamic_reconfigure -DCATKIN_BUILD_BINARY_PACKAGE=ON -DCMAKE_INSTALL_PREFIX=/opt/ros/groovy -DPYTHON_EXECUTABLE=/usr/bin/python2 -DPYTHON_INCLUDE_DIR=/usr/include/python2.7 -DPYTHON_LIBRARY=/usr/lib/libpython2.7.so -DSETUPTOOLS_DEB_LAYOUT=OFF
  make
}

package() {
  cd "${srcdir}/build"
  make DESTDIR="${pkgdir}/" install
}
