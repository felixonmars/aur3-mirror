pkgdesc="ROS - camera info manager"
url='http://www.ros.org/'

pkgname='ros-groovy-camera-info-manager'
pkgver='1.10.3'
arch=('i686' 'x86_64')
pkgrel=1
license=('BSD')
makedepends=('ros-build-tools')

depends=(ros-groovy-catkin
  boost
  ros-groovy-camera-calibration-parsers
  ros-groovy-image-transport
  ros-groovy-roscpp
  ros-groovy-roslib
  ros-groovy-rostest
  ros-groovy-sensor-msgs
)

build() {
  [ -f /opt/ros/groovy/setup.bash ] && source /opt/ros/groovy/setup.bash
  if [ -d ${srcdir}/camera_info_manager ]; then
    cd ${srcdir}/camera_info_manager
    git fetch origin --tags
    git reset --hard release/camera_info_manager/${pkgver}
  else
    git clone -b release/camera_info_manager/${pkgver} git://github.com/ros-gbp/image_common-release.git ${srcdir}/camera_info_manager
  fi
  [ -d ${srcdir}/build ] || mkdir ${srcdir}/build
  cd ${srcdir}/build
  /usr/share/ros-build-tools/fix-python-scripts.sh ${srcdir}/camera_info_manager
  cmake ${srcdir}/camera_info_manager -DCATKIN_BUILD_BINARY_PACKAGE=ON -DCMAKE_INSTALL_PREFIX=/opt/ros/groovy -DPYTHON_EXECUTABLE=/usr/bin/python2 -DPYTHON_INCLUDE_DIR=/usr/include/python2.7 -DPYTHON_LIBRARY=/usr/lib/libpython2.7.so -DSETUPTOOLS_DEB_LAYOUT=OFF
  make
}

package() {
  cd "${srcdir}/build"
  make DESTDIR="${pkgdir}/" install
}
