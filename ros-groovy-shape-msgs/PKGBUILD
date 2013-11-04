pkgdesc="ROS - shape_msgs"
url='http://www.ros.org/'

pkgname='ros-groovy-shape-msgs'
pkgver='1.9.17'
arch=('i686' 'x86_64')
pkgrel=1
license=('BSD')
makedepends=('ros-build-tools')

depends=(ros-groovy-catkin
  ros-groovy-genmsg
  ros-groovy-std-msgs
  ros-groovy-langs-dev
  ros-groovy-geometry-msgs
  ros-groovy-langs)

build() {
  [ -f /opt/ros/groovy/setup.bash ] && source /opt/ros/groovy/setup.bash
  if [ -d ${srcdir}/shape_msgs ]; then
    cd ${srcdir}/shape_msgs
#    git fetch origin --tags
#    git reset --hard release/groovy/shape_msgs/${pkgver}-0
  else
    git clone -b release/groovy/shape_msgs/${pkgver}-0 git://github.com/ros-gbp/common_msgs-release.git ${srcdir}/shape_msgs
  fi
  [ -d ${srcdir}/build ] || mkdir ${srcdir}/build
  cd ${srcdir}/build
#  /usr/share/ros-build-tools/fix-python-scripts.sh ${srcdir}/shape_msgs
  cmake ${srcdir}/shape_msgs -DCATKIN_BUILD_BINARY_PACKAGE=ON -DCMAKE_INSTALL_PREFIX=/opt/ros/groovy -DPYTHON_EXECUTABLE=/usr/bin/python2 -DCATKIN_BUILD_PREFIX=${srcdir}/build -DPYTHON_INCLUDE_DIR=/usr/include/python2.7 -DPYTHON_LIBRARY=/usr/lib/libpython2.7.so -DSETUPTOOLS_DEB_LAYOUT=OFF -Dshape_msgs_INCLUDE_DIRS=""
  make
}

package() {
  cd "${srcdir}/build"
  make DESTDIR="${pkgdir}/" install
}
