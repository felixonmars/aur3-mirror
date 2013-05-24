pkgdesc="ROS - common nodelet tools such as a mux, demux and throttle."
url='http://www.ros.org/'

pkgname='ros-groovy-nodelet-topic-tools'
pkgver='1.7.14'
arch=('i686' 'x86_64')
pkgrel=1
license=('BSD')
makedepends=('ros-build-tools')

depends=(ros-groovy-message-filters
  ros-groovy-roscpp
  ros-groovy-pluginlib
  ros-groovy-rostest
  ros-groovy-dynamic-reconfigure
  ros-groovy-nodelet)

build() {
  [ -f /opt/ros/groovy/setup.bash ] && source /opt/ros/groovy/setup.bash
  if [ -d ${srcdir}/nodelet_topic_tools ]; then
    cd ${srcdir}/nodelet_topic_tools
    git fetch origin --tags
    git reset --hard release/nodelet_topic_tools/${pkgver}
  else
    git clone -b release/nodelet_topic_tools/${pkgver} git://github.com/ros-gbp/nodelet_core-release.git ${srcdir}/nodelet_topic_tools
  fi
  [ -d ${srcdir}/build ] || mkdir ${srcdir}/build
  cd ${srcdir}/build
  /usr/share/ros-build-tools/fix-python-scripts.sh ${srcdir}/nodelet_topic_tools
  cmake ${srcdir}/nodelet_topic_tools -DCATKIN_BUILD_BINARY_PACKAGE=ON -DCMAKE_INSTALL_PREFIX=/opt/ros/groovy -DPYTHON_EXECUTABLE=/usr/bin/python2 -DPYTHON_INCLUDE_DIR=/usr/include/python2.7 -DPYTHON_LIBRARY=/usr/lib/libpython2.7.so -DSETUPTOOLS_DEB_LAYOUT=OFF
  make
}

package() {
  cd "${srcdir}/build"
  make DESTDIR="${pkgdir}/" install
}
