
pkgdesc="ROS - Provides a set of typedef's that allow using Eigen datatypes in STL containers."
url='http://www.ros.org/'

pkgname='ros-groovy-eigen-stl-containers'
pkgver='0.1.4'
arch=('i686' 'x86_64')
pkgrel=1
license=('BSD')
makedepends=('ros-build-tools')

ros_depends=(ros-groovy-catkin)
depends=(${ros_depends[@]}
  eigen3)

source=()
md5sums=()

build() {
  [ -f /opt/ros/groovy/setup.bash ] && source /opt/ros/groovy/setup.bash
  if [ -d ${srcdir}/eigen_stl_containers ]; then
    cd ${srcdir}/eigen_stl_containers
    git fetch origin --tags
    git reset --hard release/groovy/eigen_stl_containers/${pkgver}-0
  else
    git clone -b release/groovy/eigen_stl_containers/${pkgver}-0 git://github.com/ros-gbp/eigen_stl_containers-release.git ${srcdir}/eigen_stl_containers
  fi
  [ -d ${srcdir}/build ] || mkdir ${srcdir}/build
  cd ${srcdir}/build
  /usr/share/ros-build-tools/fix-python-scripts.sh ${srcdir}/eigen_stl_containers
  cmake ${srcdir}/eigen_stl_containers -DCATKIN_BUILD_BINARY_PACKAGE=ON -DCMAKE_INSTALL_PREFIX=/opt/ros/groovy -DPYTHON_EXECUTABLE=/usr/bin/python2 -DPYTHON_INCLUDE_DIR=/usr/include/python2.7 -DPYTHON_LIBRARY=/usr/lib/libpython2.7.so -DSETUPTOOLS_DEB_LAYOUT=OFF
  make
}

package() {
  cd "${srcdir}/build"
  make DESTDIR="${pkgdir}/" install
}
