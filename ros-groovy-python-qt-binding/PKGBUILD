pkgdesc="ROS - This stack provides Python bindings for Qt."
url='http://www.ros.org/'

pkgname='ros-groovy-python-qt-binding'
pkgver='0.2.11'
arch=('i686' 'x86_64')
pkgrel=1
license=('BSD, LGPL, GPL')
makedepends=('ros-build-tools')

depends=(ros-groovy-rosbuild
  ros-groovy-catkin
  qt5-base)

source=(python_qt_binding.patch)
md5sums=(5015328fb28788a2c192cf8a8dfccbd1)

build() {
  [ -f /opt/ros/groovy/setup.bash ] && source /opt/ros/groovy/setup.bash
  if [ -d ${srcdir}/python_qt_binding ]; then
    cd ${srcdir}/python_qt_binding
    git fetch origin --tags
    git reset --hard release/groovy/python_qt_binding/${pkgver}-0
  else
    git clone -b release/groovy/python_qt_binding/${pkgver}-0 git://github.com/ros-gbp/python_qt_binding-release.git ${srcdir}/python_qt_binding
  fi
  cd ${srcdir}/python_qt_binding
#patch -p1 < ${srcdir}/python_qt_binding.patch
  [ -d ${srcdir}/build ] || mkdir ${srcdir}/build
  cd ${srcdir}/build
  /usr/share/ros-build-tools/fix-python-scripts.sh ${srcdir}/python_qt_binding
  cmake ${srcdir}/python_qt_binding -DCATKIN_BUILD_BINARY_PACKAGE=ON -DCMAKE_INSTALL_PREFIX=/opt/ros/groovy -DPYTHON_EXECUTABLE=/usr/bin/python2 -DPYTHON_INCLUDE_DIR=/usr/include/python2.7 -DPYTHON_LIBRARY=/usr/lib/libpython2.7.so -DSETUPTOOLS_DEB_LAYOUT=OFF
  make
}

package() {
  cd "${srcdir}/build"
  make DESTDIR="${pkgdir}/" install
}
