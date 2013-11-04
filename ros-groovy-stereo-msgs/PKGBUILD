pkgdesc="ROS - systems specific to stereo processing, such as disparity images."
url='http://www.ros.org/'

pkgname='ros-groovy-stereo-msgs'
pkgver='1.9.17'
arch=('i686' 'x86_64')
pkgrel=1
license=('BSD')
makedepends=('ros-build-tools')

depends=(ros-groovy-catkin
  ros-groovy-genmsg
  ros-groovy-std-msgs
  ros-groovy-langs-dev
  ros-groovy-sensor-msgs
  ros-groovy-langs)

source=(deps.patch)

build() {
  [ -f /opt/ros/groovy/setup.bash ] && source /opt/ros/groovy/setup.bash
  if [ -d ${srcdir}/stereo_msgs ]; then
    cd ${srcdir}/stereo_msgs
    git fetch origin --tags
    git reset --hard release/groovy/stereo_msgs/${pkgver}-0
  else
    git clone -b release/groovy/stereo_msgs/${pkgver}-0 git://github.com/ros-gbp/common_msgs-release.git ${srcdir}/stereo_msgs
  fi
  
  # Patching.
  cd ${srcdir}
  patch -Np1 -i deps.patch

  [ -d ${srcdir}/build ] || mkdir ${srcdir}/build
  cd ${srcdir}/build
  /usr/share/ros-build-tools/fix-python-scripts.sh ${srcdir}/stereo_msgs
  cmake ${srcdir}/stereo_msgs -DCATKIN_BUILD_BINARY_PACKAGE=ON -DCMAKE_INSTALL_PREFIX=/opt/ros/groovy -DPYTHON_EXECUTABLE=/usr/bin/python2 -DPYTHON_INCLUDE_DIR=/usr/include/python2.7 -DPYTHON_LIBRARY=/usr/lib/libpython2.7.so -DSETUPTOOLS_DEB_LAYOUT=OFF -DCATKIN_BUILD_PREFIX=${srcdir}/build/devel
  make
}

package() {
  cd "${srcdir}/build"
  make DESTDIR="${pkgdir}/" install
}
md5sums=('61a49403711be3f20fb82327c11457d7')
