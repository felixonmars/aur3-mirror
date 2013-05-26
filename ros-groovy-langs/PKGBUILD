pkgdesc="ROS - Meta package modeling the run-time dependencies for language bindings of messages."
url='http://www.ros.org/'

pkgname='ros-groovy-langs'
pkgver='0.4.8'
arch=('i686' 'x86_64')
pkgrel=1
license=('BSD')
makedepends=('ros-build-tools')

depends=(ros-groovy-catkin
  ros-groovy-roscpp-serialization
  ros-groovy-rostime
  ros-groovy-cpp-common
  ros-groovy-roscpp-traits
  ros-groovy-langs-dev)

build() {
  [ -f /opt/ros/groovy/setup.bash ] && source /opt/ros/groovy/setup.bash
  if [ -d ${srcdir}/langs ]; then
    cd ${srcdir}/langs
    git fetch origin --tags
    git reset --hard release/langs/${pkgver}
  else
    git clone -b release/langs/${pkgver} git://github.com/ros-gbp/langs-release.git ${srcdir}/langs
  fi
  [ -d ${srcdir}/build ] || mkdir ${srcdir}/build
  cd ${srcdir}/build
  /usr/share/ros-build-tools/fix-python-scripts.sh ${srcdir}/langs
  cmake ${srcdir}/langs -DCATKIN_BUILD_BINARY_PACKAGE=ON -DCMAKE_INSTALL_PREFIX=/opt/ros/groovy -DPYTHON_EXECUTABLE=/usr/bin/python2 -DPYTHON_INCLUDE_DIR=/usr/include/python2.7 -DPYTHON_LIBRARY=/usr/lib/libpython2.7.so -DSETUPTOOLS_DEB_LAYOUT=OFF
  make
}

package() {
  cd "${srcdir}/build"
  make DESTDIR="${pkgdir}/" install
}
