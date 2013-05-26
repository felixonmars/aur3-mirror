pkgdesc="ROS - Base dependencies and support libraries for ROS."
url='http://www.ros.org/'

pkgname='ros-groovy-roslib'
pkgver='1.9.45'
arch=('i686' 'x86_64')
pkgrel=1
license=('BSD')
makedepends=('ros-build-tools')

depends=(
  ros-groovy-rospack
  ros-groovy-catkin
  boost)

build() {
  [ -f /opt/ros/groovy/setup.bash ] && source /opt/ros/groovy/setup.bash
  if [ -d ${srcdir}/roslib ]; then
    cd ${srcdir}/roslib
    git fetch origin --tags
    git reset --hard release/groovy/roslib/${pkgver}-0
  else
    git clone -b release/groovy/roslib/${pkgver}-0 git://github.com/ros-gbp/ros-release.git ${srcdir}/roslib
  fi
  [ -d ${srcdir}/build ] || mkdir ${srcdir}/build
  cd ${srcdir}/build
  /usr/share/ros-build-tools/fix-python-scripts.sh ${srcdir}/roslib
  sed -i ${srcdir}/roslib/env-hooks/10.ros.sh.em -f - <<'==='
s/python -c/python2 -c/
===
  cmake ${srcdir}/roslib -DCATKIN_BUILD_BINARY_PACKAGE=ON -DCMAKE_INSTALL_PREFIX=/opt/ros/groovy -DPYTHON_EXECUTABLE=/usr/bin/python2 -DPYTHON_INCLUDE_DIR=/usr/include/python2.7 -DPYTHON_LIBRARY=/usr/lib/libpython2.7.so -DSETUPTOOLS_DEB_LAYOUT=OFF
  make
}

package() {
  cd "${srcdir}/build"
  make DESTDIR="${pkgdir}/" install
}
