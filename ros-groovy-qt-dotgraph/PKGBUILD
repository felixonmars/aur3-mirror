# Maintainer: Sean Greenslade <sean at seangreenslade dot com>
pkgdesc="ROS - qt_dotgraph"
url='http://www.ros.org/'

pkgname='ros-groovy-qt-dotgraph'
pkgver='0.2.12'
arch=('i686' 'x86_64')
pkgrel=2
license=('BSD')
makedepends=('ros-build-tools')

depends=(
  python2-pydot
  python2-rospkg
  ros-groovy-catkin
  ros-groovy-python-qt-binding
  qt4
)
build() {
  [ -f /opt/ros/groovy/setup.bash ] && source /opt/ros/groovy/setup.bash
  if [ -d ${srcdir}/qt_dotgraph ]; then
    cd ${srcdir}/qt_dotgraph
    git fetch origin --tags
    git reset --hard release/qt_dotgraph/${pkgver}
  else
    git clone -b release/qt_dotgraph/${pkgver} git://github.com/ros-gbp/qt_gui_core-release.git ${srcdir}/qt_dotgraph
  fi
  [ -d ${srcdir}/build ] || mkdir ${srcdir}/build
  cd ${srcdir}/build
  /usr/share/ros-build-tools/fix-python-scripts.sh ${srcdir}/qt_dotgraph
  cmake ${srcdir}/qt_dotgraph -DCATKIN_BUILD_BINARY_PACKAGE=ON -DCMAKE_INSTALL_PREFIX=/opt/ros/groovy -DPYTHON_EXECUTABLE=/usr/bin/python2 -DPYTHON_INCLUDE_DIR=/usr/include/python2.7 -DPYTHON_LIBRARY=/usr/lib/libpython2.7.so -DSETUPTOOLS_DEB_LAYOUT=OFF
  make
}

package() {
  cd "${srcdir}/build"
  make DESTDIR="${pkgdir}/" install
}
