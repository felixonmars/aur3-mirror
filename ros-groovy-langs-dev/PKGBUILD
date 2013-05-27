pkgdesc="ROS - package for modeling the build-time dependencies for language bindings of messages."
url='http://www.ros.org/'

pkgname='ros-groovy-langs-dev'
pkgver='0.2.8'
arch=('i686' 'x86_64')
pkgrel=1
license=('BSD')
makedepends=('ros-build-tools')

depends=(ros-groovy-gencpp
  ros-groovy-catkin
  ros-groovy-genlisp
  ros-groovy-genpy)

build() {
  [ -f /opt/ros/groovy/setup.bash ] && source /opt/ros/groovy/setup.bash
  if [ -d ${srcdir}/langs-dev ]; then
    cd ${srcdir}/langs-dev
    git fetch origin --tags
    git reset --hard release/langs-dev/${pkgver}
  else
    git clone -b release/langs-dev/${pkgver} git://github.com/ros-gbp/langs-dev-release.git ${srcdir}/langs-dev
  fi
  [ -d ${srcdir}/build ] || mkdir ${srcdir}/build
  cd ${srcdir}/build
  /usr/share/ros-build-tools/fix-python-scripts.sh ${srcdir}/langs-dev
  cmake ${srcdir}/langs-dev -DCATKIN_BUILD_BINARY_PACKAGE=ON -DCMAKE_INSTALL_PREFIX=/opt/ros/groovy -DPYTHON_EXECUTABLE=/usr/bin/python2 -DPYTHON_INCLUDE_DIR=/usr/include/python2.7 -DPYTHON_LIBRARY=/usr/lib/libpython2.7.so -DSETUPTOOLS_DEB_LAYOUT=OFF
  make
}

package() {
  cd "${srcdir}/build"
  make DESTDIR="${pkgdir}/" install
}
