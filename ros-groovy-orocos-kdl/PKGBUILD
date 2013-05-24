pkgdesc="ROS - Kinematics and Dynamics Library (KDL), distributed by the Orocos Project."
url='http://www.ros.org/'

pkgname='ros-groovy-orocos-kdl'
pkgver='1.1.99'
arch=('i686' 'x86_64')
pkgrel=1
license=('LGPL')
makedepends=('ros-build-tools')

depends=(ros-groovy-catkin
  eigen3
  cppunit
  pkg-config)

build() {
  [ -f /opt/ros/groovy/setup.bash ] && source /opt/ros/groovy/setup.bash
  if [ -d ${srcdir}/orocos_kdl ]; then
    cd ${srcdir}/orocos_kdl
    git fetch origin --tags
    git reset --hard release/orocos_kdl/${pkgver}
  else
    git clone -b release/orocos_kdl/${pkgver} git://github.com/ros-gbp/orocos_kdl-release.git ${srcdir}/orocos_kdl
  fi
  [ -d ${srcdir}/build ] || mkdir ${srcdir}/build
  cd ${srcdir}/build
  /usr/share/ros-build-tools/fix-python-scripts.sh ${srcdir}/orocos_kdl
  cmake ${srcdir}/orocos_kdl -DCATKIN_BUILD_BINARY_PACKAGE=ON -DCMAKE_INSTALL_PREFIX=/opt/ros/groovy -DPYTHON_EXECUTABLE=/usr/bin/python2 -DPYTHON_INCLUDE_DIR=/usr/include/python2.7 -DPYTHON_LIBRARY=/usr/lib/libpython2.7.so -DSETUPTOOLS_DEB_LAYOUT=OFF
  make
}

package() {
  cd "${srcdir}/build"
  make DESTDIR="${pkgdir}/" install
}
