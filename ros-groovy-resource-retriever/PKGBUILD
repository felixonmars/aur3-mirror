pkgdesc="ROS - retrieves data from url-format files."
url='http://www.ros.org/'

pkgname='ros-groovy-resource-retriever'
pkgver='1.9.35'
arch=('i686' 'x86_64')
pkgrel=1
license=('BSD')
makedepends=('ros-build-tools')

depends=(ros-groovy-catkin
  ros-groovy-roslib
  ros-groovy-rosconsole
  curl)

build() {
  [ -f /opt/ros/groovy/setup.bash ] && source /opt/ros/groovy/setup.bash
  if [ -d ${srcdir}/resource_retriever ]; then
    cd ${srcdir}/resource_retriever
    git fetch origin --tags
    git reset --hard release/groovy/resource_retriever/${pkgver}-0
  else
    git clone -b release/groovy/resource_retriever/${pkgver}-0 git://github.com/ros-gbp/robot_model-release.git ${srcdir}/resource_retriever
  fi
  [ -d ${srcdir}/build ] || mkdir ${srcdir}/build
  cd ${srcdir}/build
  /usr/share/ros-build-tools/fix-python-scripts.sh ${srcdir}/resource_retriever
  cmake ${srcdir}/resource_retriever -DCATKIN_BUILD_BINARY_PACKAGE=ON -DCMAKE_INSTALL_PREFIX=/opt/ros/groovy -DPYTHON_EXECUTABLE=/usr/bin/python2 -DPYTHON_INCLUDE_DIR=/usr/include/python2.7 -DPYTHON_LIBRARY=/usr/lib/libpython2.7.so -DSETUPTOOLS_DEB_LAYOUT=OFF
  make
}

package() {
  cd "${srcdir}/build"
  make DESTDIR="${pkgdir}/" install
}
