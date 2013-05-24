pkgdesc="ROS - python implementation of bond."
url='http://www.ros.org/'

pkgname='ros-groovy-bondpy'
pkgver='1.7.10'
arch=('i686' 'x86_64')
pkgrel=1
license=('BSD')
makedepends=('ros-build-tools')

depends=(ros-groovy-roscpp
  ros-groovy-catkin
  ros-groovy-bond
  ros-groovy-smclib
  boost
  uuid)

build() {
  [ -f /opt/ros/groovy/setup.bash ] && source /opt/ros/groovy/setup.bash
  if [ -d ${srcdir}/bondpy ]; then
    cd ${srcdir}/bondpy
    git fetch origin --tags
    git reset --hard release/bondpy/${pkgver}
  else
    git clone -b release/bondpy/${pkgver} git://github.com/ros-gbp/bond_core-release.git ${srcdir}/bondpy
  fi
  [ -d ${srcdir}/build ] || mkdir ${srcdir}/build
  cd ${srcdir}/build
  /usr/share/ros-build-tools/fix-python-scripts.sh ${srcdir}/bondpy
  cmake ${srcdir}/bondpy -DCATKIN_BUILD_BINARY_PACKAGE=ON -DCMAKE_INSTALL_PREFIX=/opt/ros/groovy -DPYTHON_EXECUTABLE=/usr/bin/python2 -DPYTHON_INCLUDE_DIR=/usr/include/python2.7 -DPYTHON_LIBRARY=/usr/lib/libpython2.7.so -DSETUPTOOLS_DEB_LAYOUT=OFF
  make
}

package() {
  cd "${srcdir}/build"
  make DESTDIR="${pkgdir}/" install
}
