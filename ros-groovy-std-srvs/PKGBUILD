pkgdesc="ROS - Common service definitions. Currently just the 'Empty' service."
url='http://www.ros.org/'

pkgname='ros-groovy-std-srvs'
pkgver='1.9.50'
arch=('i686' 'x86_64')
pkgrel=1
license=('BSD')
makedepends=('ros-build-tools')

depends=(ros-groovy-langs-dev
  ros-groovy-catkin
  ros-groovy-genmsg
  ros-groovy-langs)

build() {
  [ -f /opt/ros/groovy/setup.bash ] && source /opt/ros/groovy/setup.bash
  if [ -d ${srcdir}/std_srvs ]; then
    cd ${srcdir}/std_srvs
    git fetch origin --tags
    git reset --hard release/groovy/std_srvs/${pkgver}-0
  else
    git clone -b release/groovy/std_srvs/${pkgver}-0 git://github.com/ros-gbp/ros_comm-release.git ${srcdir}/std_srvs
  fi
  [ -d ${srcdir}/build ] || mkdir ${srcdir}/build
  cd ${srcdir}/build
  /usr/share/ros-build-tools/fix-python-scripts.sh ${srcdir}/std_srvs
  cmake ${srcdir}/std_srvs -DCATKIN_BUILD_BINARY_PACKAGE=ON -DCMAKE_INSTALL_PREFIX=/opt/ros/groovy -DPYTHON_EXECUTABLE=/usr/bin/python2 -DPYTHON_INCLUDE_DIR=/usr/include/python2.7 -DPYTHON_LIBRARY=/usr/lib/libpython2.7.so -DSETUPTOOLS_DEB_LAYOUT=OFF
  make
}

package() {
  cd "${srcdir}/build"
  make DESTDIR="${pkgdir}/" install
}
