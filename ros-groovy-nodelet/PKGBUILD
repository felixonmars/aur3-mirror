pkgdesc="ROS - provides a way to run multiple algorithms in the same process."
url='http://www.ros.org/'

pkgname='ros-groovy-nodelet'
pkgver='1.7.14'
arch=('i686' 'x86_64')
pkgrel=1
license=('BSD')
makedepends=('ros-build-tools')

depends=(ros-groovy-bondcpp
  ros-groovy-roscpp
  ros-groovy-genmsg
  ros-groovy-pluginlib
  ros-groovy-rosconsole
  ros-groovy-rospy
  ros-groovy-langs-dev
  ros-groovy-langs
  boost
  uuid
  tinyxml)

source=(includefix.patch)

build() {
  [ -f /opt/ros/groovy/setup.bash ] && source /opt/ros/groovy/setup.bash
  if [ -d ${srcdir}/nodelet ]; then
    cd ${srcdir}/nodelet
    git fetch origin --tags
    git reset --hard release/nodelet/${pkgver}
  else
    git clone -b release/nodelet/${pkgver} git://github.com/ros-gbp/nodelet_core-release.git ${srcdir}/nodelet
  fi
  cd ${srcdir}
  patch -Np1 -i includefix.patch
  cd ${srcdir}/nodelet 
  [ -d ${srcdir}/build ] || mkdir ${srcdir}/build
  cd ${srcdir}/build
  /usr/share/ros-build-tools/fix-python-scripts.sh ${srcdir}/nodelet
  cmake ${srcdir}/nodelet -DCATKIN_BUILD_BINARY_PACKAGE=ON -DCMAKE_INSTALL_PREFIX=/opt/ros/groovy -DPYTHON_EXECUTABLE=/usr/bin/python2 -DPYTHON_INCLUDE_DIR=/usr/include/python2.7 -DPYTHON_LIBRARY=/usr/lib/libpython2.7.so -DSETUPTOOLS_DEB_LAYOUT=OFF
  make
}

package() {
  cd "${srcdir}/build"
  make DESTDIR="${pkgdir}/" install
}
md5sums=('c35603af609da93b5fd3ee24e690d6dd')
