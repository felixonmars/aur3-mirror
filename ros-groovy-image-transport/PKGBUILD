pkgdesc="ROS - provides transparent support for transporting images."
url='http://www.ros.org/'

pkgname='ros-groovy-image-transport'
pkgver='1.10.3'
arch=('i686' 'x86_64')
pkgrel=1
license=('BSD')
makedepends=('ros-build-tools')

depends=(ros-groovy-message-filters
  ros-groovy-roscpp
  ros-groovy-catkin
  ros-groovy-pluginlib
  ros-groovy-roslib
  ros-groovy-rosconsole
  ros-groovy-sensor-msgs)

build() {
  [ -f /opt/ros/groovy/setup.bash ] && source /opt/ros/groovy/setup.bash
  if [ -d ${srcdir}/image_transport ]; then
    cd ${srcdir}/image_transport
    git fetch origin --tags
    git reset --hard release/image_transport/${pkgver}
  else
    git clone -b release/image_transport/${pkgver} git://github.com/ros-gbp/image_common-release.git ${srcdir}/image_transport
  fi
  [ -d ${srcdir}/build ] || mkdir ${srcdir}/build
  cd ${srcdir}/build
  /usr/share/ros-build-tools/fix-python-scripts.sh ${srcdir}/image_transport
  cmake ${srcdir}/image_transport -DCATKIN_BUILD_BINARY_PACKAGE=ON -DCMAKE_INSTALL_PREFIX=/opt/ros/groovy -DPYTHON_EXECUTABLE=/usr/bin/python2 -DPYTHON_INCLUDE_DIR=/usr/include/python2.7 -DPYTHON_LIBRARY=/usr/lib/libpython2.7.so -DSETUPTOOLS_DEB_LAYOUT=OFF
  make
}

package() {
  cd "${srcdir}/build"
  make DESTDIR="${pkgdir}/" install
}
