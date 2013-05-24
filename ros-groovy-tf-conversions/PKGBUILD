pkgdesc="ROS - tf conversion libraries."
url='http://www.ros.org/'

pkgname='ros-groovy-tf-conversions'
pkgver='1.9.29'
arch=('i686' 'x86_64')
pkgrel=1
license=('BSD')
makedepends=('ros-build-tools')

depends=(ros-groovy-geometry-msgs
  ros-groovy-kdl-conversions
  ros-groovy-tf
  eigen)

build() {
  [ -f /opt/ros/groovy/setup.bash ] && source /opt/ros/groovy/setup.bash
  if [ -d ${srcdir}/tf_conversions ]; then
    cd ${srcdir}/tf_conversions
    git fetch origin --tags
    git reset --hard release/tf_conversions/${pkgver}
  else
    git clone -b release/tf_conversions/${pkgver} git://github.com/ros-gbp/geometry-release.git ${srcdir}/tf_conversions
  fi
  [ -d ${srcdir}/build ] || mkdir ${srcdir}/build
  cd ${srcdir}/build
  /usr/share/ros-build-tools/fix-python-scripts.sh ${srcdir}/tf_conversions
  cmake ${srcdir}/tf_conversions -DCATKIN_BUILD_BINARY_PACKAGE=ON -DCMAKE_INSTALL_PREFIX=/opt/ros/groovy -DPYTHON_EXECUTABLE=/usr/bin/python2 -DPYTHON_INCLUDE_DIR=/usr/include/python2.7 -DPYTHON_LIBRARY=/usr/lib/libpython2.7.so -DSETUPTOOLS_DEB_LAYOUT=OFF
  make
}

package() {
  cd "${srcdir}/build"
  make DESTDIR="${pkgdir}/" install
}
