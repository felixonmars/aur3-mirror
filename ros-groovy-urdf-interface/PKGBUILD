pkgdesc="ROS - URDF C++ interface headers."
url='http://www.ros.org/'

pkgname='ros-groovy-urdf-interface'
pkgver='1.9.36'
arch=('i686' 'x86_64')
pkgrel=1
license=('BSD')
makedepends=('ros-build-tools')

depends=(ros-groovy-catkin
  ros-groovy-urdfdom)

build() {
  [ -f /opt/ros/groovy/setup.bash ] && source /opt/ros/groovy/setup.bash
  if [ -d ${srcdir}/urdf_interface ]; then
    cd ${srcdir}/urdf_interface
    git fetch origin --tags
    git reset --hard release/groovy/urdf_interface/${pkgver}-0
  else
    git clone -b release/groovy/urdf_interface/${pkgver}-0 git://github.com/ros-gbp/robot_model-release.git ${srcdir}/urdf_interface
  fi
  [ -d ${srcdir}/build ] || mkdir ${srcdir}/build
  cd ${srcdir}/build
  /usr/share/ros-build-tools/fix-python-scripts.sh ${srcdir}/urdf_interface
  cmake ${srcdir}/urdf_interface -DCATKIN_BUILD_BINARY_PACKAGE=ON -DCMAKE_INSTALL_PREFIX=/opt/ros/groovy -DPYTHON_EXECUTABLE=/usr/bin/python2 -DPYTHON_INCLUDE_DIR=/usr/include/python2.7 -DPYTHON_LIBRARY=/usr/lib/libpython2.7.so -DSETUPTOOLS_DEB_LAYOUT=OFF
  make
}

package() {
  cd "${srcdir}/build"
  make DESTDIR="${pkgdir}/" install
}
