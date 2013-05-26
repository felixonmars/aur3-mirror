pkgdesc="ROS - includes things like the ROS_DEPRECATED and ROS_FORCE_INLINE macros."
url='http://www.ros.org/'

pkgname='ros-groovy-cpp-common'
pkgver='0.3.14'
arch=('i686' 'x86_64')
pkgrel=1
license=('BSD')
makedepends=('ros-build-tools')

depends=(ros-groovy-catkin)

build() {
  [ -f /opt/ros/groovy/setup.bash ] && source /opt/ros/groovy/setup.bash
  if [ -d ${srcdir}/cpp_common ]; then
    cd ${srcdir}/cpp_common
    git fetch origin --tags
    git reset --hard release/groovy/cpp_common/${pkgver}-0
  else
    git clone -b release/groovy/cpp_common/${pkgver}-0 git://github.com/ros-gbp/roscpp_core-release.git ${srcdir}/cpp_common
  fi
  [ -d ${srcdir}/build ] || mkdir ${srcdir}/build
  cd ${srcdir}/build
  /usr/share/ros-build-tools/fix-python-scripts.sh ${srcdir}/cpp_common
  cmake ${srcdir}/cpp_common -DCATKIN_BUILD_BINARY_PACKAGE=ON -DCMAKE_INSTALL_PREFIX=/opt/ros/groovy -DPYTHON_EXECUTABLE=/usr/bin/python2 -DPYTHON_INCLUDE_DIR=/usr/include/python2.7 -DPYTHON_LIBRARY=/usr/lib/libpython2.7.so -DSETUPTOOLS_DEB_LAYOUT=OFF
  make
}

package() {
  cd "${srcdir}/build"
  make DESTDIR="${pkgdir}/" install
}
