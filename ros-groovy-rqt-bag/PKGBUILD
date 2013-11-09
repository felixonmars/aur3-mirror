pkgdesc="ROS - GUI plugin for displaying and replaying ROS bag files."
url='https://github.com/ros-gbp/rqt_common_plugins-release'

pkgname='ros-groovy-rqt-bag'
pkgver='0.3.2'
arch=('i686' 'x86_64')
pkgrel=1
license=('BSD')
makedepends=('ros-build-tools')

depends=(
  'ros-groovy-rosbag'
  'ros-groovy-roslib'
  'ros-groovy-rospy'
  'ros-groovy-rqt-gui>=0.2.12'
  'ros-groovy-rqt-gui-py'
  'qt4'
)

_name='rqt_bag'

build() {
  [ -f /opt/ros/groovy/setup.bash ] && source /opt/ros/groovy/setup.bash
  if [ -d ${srcdir}/${_name} ]; then
    cd ${srcdir}/${_name}
    git fetch origin --tags
    git reset --hard release/groovy/${_name}/${pkgver}-0
  else
    git clone -b release/groovy/${_name}/${pkgver}-0 git://github.com/ros-gbp/rqt_common_plugins-release.git ${srcdir}/${_name}
  fi
  [ -d ${srcdir}/build ] || mkdir ${srcdir}/build
  cd ${srcdir}/build
  /usr/share/ros-build-tools/fix-python-scripts.sh ${srcdir}/${_name}
  cmake ${srcdir}/${_name} -DCATKIN_BUILD_BINARY_PACKAGE=ON -DCMAKE_INSTALL_PREFIX=/opt/ros/groovy -DPYTHON_EXECUTABLE=/usr/bin/python2 -DPYTHON_INCLUDE_DIR=/usr/include/python2.7 -DPYTHON_LIBRARY=/usr/lib/libpython2.7.so -DSETUPTOOLS_DEB_LAYOUT=OFF
  make
}

package() {
  cd "${srcdir}/build"
  make DESTDIR="${pkgdir}/" install
}
