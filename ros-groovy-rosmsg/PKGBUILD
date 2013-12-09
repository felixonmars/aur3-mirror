pkgdesc="ROS - contains two command-line tools: rosmsg and rossrv."
url='http://www.ros.org/'

pkgname='ros-groovy-rosmsg'
pkgver='1.9.50'
arch=('i686' 'x86_64')
pkgrel=1
license=('BSD')
makedepends=('ros-build-tools')

depends=(ros-groovy-roslib
  ros-groovy-catkin
  ros-groovy-genmsg
  ros-groovy-rosbag)

build() {
  [ -f /opt/ros/groovy/setup.bash ] && source /opt/ros/groovy/setup.bash
  if [ -d ${srcdir}/rosmsg ]; then
    cd ${srcdir}/rosmsg
    git fetch origin --tags
    git reset --hard release/groovy/rosmsg/${pkgver}-0
  else
    git clone -b release/groovy/rosmsg/${pkgver}-0 git://github.com/ros-gbp/ros_comm-release.git ${srcdir}/rosmsg
  fi
  [ -d ${srcdir}/build ] || mkdir ${srcdir}/build
  cd ${srcdir}/build
  /usr/share/ros-build-tools/fix-python-scripts.sh ${srcdir}/rosmsg
  cmake ${srcdir}/rosmsg -DCATKIN_BUILD_BINARY_PACKAGE=ON -DCMAKE_INSTALL_PREFIX=/opt/ros/groovy -DPYTHON_EXECUTABLE=/usr/bin/python2 -DPYTHON_INCLUDE_DIR=/usr/include/python2.7 -DPYTHON_LIBRARY=/usr/lib/libpython2.7.so -DSETUPTOOLS_DEB_LAYOUT=OFF
  make
}

package() {
  cd "${srcdir}/build"
  make DESTDIR="${pkgdir}/" install
}
