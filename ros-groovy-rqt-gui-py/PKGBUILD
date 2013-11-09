pkgdesc="ROS - rqt_gui_py"
url='https://github.com/ros-gbp/rqt-release'

pkgname='ros-groovy-rqt-gui-py'
pkgver='0.2.12'
arch=('i686' 'x86_64')
pkgrel=1
license=('BSD')
makedepends=('ros-build-tools')

depends=(
  ros-groovy-catkin
  ros-groovy-rqt-gui
  ros-groovy-rospy
  qt4
)
build() {
  [ -f /opt/ros/groovy/setup.bash ] && source /opt/ros/groovy/setup.bash
  if [ -d ${srcdir}/rqt_gui_py ]; then
    cd ${srcdir}/rqt_gui_py
    git fetch origin --tags
    git reset --hard release/groovy/rqt_gui_py/${pkgver}-0
  else
    git clone -b release/groovy/rqt_gui_py/${pkgver}-0 git://github.com/ros-gbp/rqt-release.git ${srcdir}/rqt_gui_py
  fi
  [ -d ${srcdir}/build ] || mkdir ${srcdir}/build
  cd ${srcdir}/build
  /usr/share/ros-build-tools/fix-python-scripts.sh ${srcdir}/rqt_gui_py
  cmake ${srcdir}/rqt_gui_py -DCATKIN_BUILD_BINARY_PACKAGE=ON -DCMAKE_INSTALL_PREFIX=/opt/ros/groovy -DPYTHON_EXECUTABLE=/usr/bin/python2 -DPYTHON_INCLUDE_DIR=/usr/include/python2.7 -DPYTHON_LIBRARY=/usr/lib/libpython2.7.so -DSETUPTOOLS_DEB_LAYOUT=OFF
  make
}

package() {
  cd "${srcdir}/build"
  make DESTDIR="${pkgdir}/" install
}
