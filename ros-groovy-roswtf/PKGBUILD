pkgdesc="ROS - a tool for diagnosing issues with a running ROS system."
url='http://www.ros.org/'

pkgname='ros-groovy-roswtf'
pkgver='1.9.50'
arch=('i686' 'x86_64')
pkgrel=1
license=('BSD')
makedepends=('ros-build-tools')

depends=(ros-groovy-catkin
  ros-groovy-rosgraph
  ros-groovy-roslib
  ros-groovy-roslaunch
  ros-groovy-rostest
  ros-groovy-rosservice
  ros-groovy-rosnode
  python2-paramiko)

build() {
  [ -f /opt/ros/groovy/setup.bash ] && source /opt/ros/groovy/setup.bash
  if [ -d ${srcdir}/roswtf ]; then
    cd ${srcdir}/roswtf
    git fetch origin --tags
    git reset --hard release/groovy/roswtf/${pkgver}-0
  else
    git clone -b release/groovy/roswtf/${pkgver}-0 git://github.com/ros-gbp/ros_comm-release.git ${srcdir}/roswtf
  fi
  [ -d ${srcdir}/build ] || mkdir ${srcdir}/build
  cd ${srcdir}/build
  /usr/share/ros-build-tools/fix-python-scripts.sh ${srcdir}/roswtf
  cmake ${srcdir}/roswtf -DCATKIN_BUILD_BINARY_PACKAGE=ON -DCMAKE_INSTALL_PREFIX=/opt/ros/groovy -DPYTHON_EXECUTABLE=/usr/bin/python2 -DPYTHON_INCLUDE_DIR=/usr/include/python2.7 -DPYTHON_LIBRARY=/usr/lib/libpython2.7.so -DSETUPTOOLS_DEB_LAYOUT=OFF
  make
}

package() {
  cd "${srcdir}/build"
  make DESTDIR="${pkgdir}/" install
}
