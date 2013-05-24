pkgdesc="ROS - OpenCV"
url='http://www.ros.org/'

pkgname='ros-groovy-opencv2'
pkgver='2.4.5'
arch=('i686' 'x86_64')
pkgrel=1
license=('BSD')
makedepends=('ros-build-tools')

depends=(ros-groovy-catkin
  v4l-utils
  texlive-core
  python2-numpy
  ffmpeg
  libjpeg
  zlib
  gtk2
  python2
  jasper
  libpng12
  libtiff)

build() {
  [ -f /opt/ros/groovy/setup.bash ] && source /opt/ros/groovy/setup.bash
  if [ -d ${srcdir}/opencv2 ]; then
    cd ${srcdir}/opencv2
    git fetch origin --tags
    git reset --hard release/groovy/opencv2/${pkgver}-2
  else
    git clone -b release/groovy/opencv2/${pkgver}-2 git://github.com/ros-gbp/opencv2-release.git ${srcdir}/opencv2
  fi
  [ -d ${srcdir}/build ] || mkdir ${srcdir}/build
  cd ${srcdir}/build
  /usr/share/ros-build-tools/fix-python-scripts.sh ${srcdir}/opencv2
  cmake ${srcdir}/opencv2 -DCATKIN_BUILD_BINARY_PACKAGE=ON -DCMAKE_INSTALL_PREFIX=/opt/ros/groovy -DPYTHON_EXECUTABLE=/usr/bin/python2 -DPYTHON_INCLUDE_DIR=/usr/include/python2.7 -DPYTHON_LIBRARY=/usr/lib/libpython2.7.so -DSETUPTOOLS_DEB_LAYOUT=OFF
  make
}

package() {
  cd "${srcdir}/build"
  make DESTDIR="${pkgdir}/" install
}
