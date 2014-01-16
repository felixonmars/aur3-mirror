pkgdesc="ROS - Common functionality for rqt plugins written in Python."
url='http://www.ros.org/'

pkgname='ros-groovy-rqt-py-common'
pkgver='0.3.2'
arch=('i686' 'x86_64')
pkgrel=1
license=('BSD')
makedepends=('ros-build-tools')

depends=(
  'ros-groovy-actionlib'
  'ros-groovy-genpy'
  'ros-groovy-qt-gui'
  'ros-groovy-rosbag'
  'ros-groovy-roslib'
  'ros-groovy-rostopic'
  'ros-groovy-rospy'
  'ros-groovy-rqt-gui'
  'ros-groovy-rqt-gui-py'
  'qt4'
)
build() {
  [ -f /opt/ros/groovy/setup.bash ] && source /opt/ros/groovy/setup.bash
  if [ -d ${srcdir}/rqt_py_common ]; then
    cd ${srcdir}/rqt_py_common
    git fetch origin --tags
    git reset --hard release/groovy/rqt_py_common/${pkgver}-0
  else
    git clone -b release/groovy/rqt_py_common/${pkgver}-0 git://github.com/ros-gbp/rqt_common_plugins-release.git ${srcdir}/rqt_py_common
  fi
  [ -d ${srcdir}/build ] || mkdir ${srcdir}/build
  cd ${srcdir}/build
  /usr/share/ros-build-tools/fix-python-scripts.sh ${srcdir}/rqt_py_common
  cmake ${srcdir}/rqt_py_common -DCATKIN_BUILD_BINARY_PACKAGE=ON -DCMAKE_INSTALL_PREFIX=/opt/ros/groovy -DPYTHON_EXECUTABLE=/usr/bin/python2 -DPYTHON_INCLUDE_DIR=/usr/include/python2.7 -DPYTHON_LIBRARY=/usr/lib/libpython2.7.so -DSETUPTOOLS_DEB_LAYOUT=OFF
  make
}

package() {
  cd "${srcdir}/build"
  make DESTDIR="${pkgdir}/" install
}
