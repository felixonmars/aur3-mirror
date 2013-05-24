pkgdesc="ROS - Convex Decomposition Tool for Robot Model"
url='http://www.ros.org/'

pkgname='ros-groovy-convex-decomposition'
pkgver='0.1.9'
arch=('i686' 'x86_64')
pkgrel=1
license=('MIT')
makedepends=('ros-build-tools')

depends=(ros-groovy-catkin
  unzip)

build() {
  [ -f /opt/ros/groovy/setup.bash ] && source /opt/ros/groovy/setup.bash
  if [ -d ${srcdir}/convex_decomposition ]; then
    cd ${srcdir}/convex_decomposition
    git fetch origin --tags
    git reset --hard release/convex_decomposition/${pkgver}
  else
    git clone -b release/convex_decomposition/${pkgver} git://github.com/ros-gbp/convex_decomposition-release.git ${srcdir}/convex_decomposition
  fi
  [ -d ${srcdir}/build ] || mkdir ${srcdir}/build
  cd ${srcdir}/build
  /usr/share/ros-build-tools/fix-python-scripts.sh ${srcdir}/convex_decomposition
  cmake ${srcdir}/convex_decomposition -DCATKIN_BUILD_BINARY_PACKAGE=ON -DCMAKE_INSTALL_PREFIX=/opt/ros/groovy -DPYTHON_EXECUTABLE=/usr/bin/python2 -DPYTHON_INCLUDE_DIR=/usr/include/python2.7 -DPYTHON_LIBRARY=/usr/lib/libpython2.7.so -DSETUPTOOLS_DEB_LAYOUT=OFF
  make
}

package() {
  cd "${srcdir}/build"
  make DESTDIR="${pkgdir}/" install
}
