
pkgdesc="ROS - Driver file descriptions for P2OS/ARCOS robot."
url='http://www.ros.org/'

pkgname='ros-hydro-p2os-driver'
pkgver='1.0.9'
_pkgver_patch=1
arch=('i686' 'x86_64')
pkgrel=1
license=('BSD')

ros_makedepends=(ros-hydro-message-generation
  ros-hydro-diagnostic-updater
  ros-hydro-roscpp
  ros-hydro-geometry-msgs
  ros-hydro-catkin
  ros-hydro-nav-msgs
  ros-hydro-tf
  ros-hydro-std-msgs)
makedepends=('cmake' 'git' 'ros-build-tools'
  ${ros_makedepends[@]})

ros_depends=(ros-hydro-message-runtime
  ros-hydro-diagnostic-updater
  ros-hydro-roscpp
  ros-hydro-geometry-msgs
  ros-hydro-nav-msgs
  ros-hydro-tf
  ros-hydro-std-msgs)
depends=(${ros_depends[@]})

_tag=release/hydro/p2os_driver/${pkgver}-${_pkgver_patch}
_dir=p2os_driver
source=("${_dir}"::"git+https://github.com/allenh1/p2os-release.git"#tag=${_tag})
md5sums=('SKIP')

build() {
  # Use ROS environment variables
  /usr/share/ros-build-tools/clear-ros-env.sh
  [ -f /opt/ros/hydro/setup.bash ] && source /opt/ros/hydro/setup.bash

  # Create build directory
  [ -d ${srcdir}/build ] || mkdir ${srcdir}/build
  cd ${srcdir}/build

  # Fix Python2/Python3 conflicts
  /usr/share/ros-build-tools/fix-python-scripts.sh ${srcdir}/${_dir}

  # Build project
  cmake ${srcdir}/${_dir} \
        -DCMAKE_BUILD_TYPE=Release \
        -DCATKIN_BUILD_BINARY_PACKAGE=ON \
        -DCMAKE_INSTALL_PREFIX=/opt/ros/hydro \
        -DPYTHON_EXECUTABLE=/usr/bin/python2 \
        -DPYTHON_INCLUDE_DIR=/usr/include/python2.7 \
        -DPYTHON_LIBRARY=/usr/lib/libpython2.7.so \
        -DSETUPTOOLS_DEB_LAYOUT=OFF
  make
}

package() {
  cd "${srcdir}/build"
  make DESTDIR="${pkgdir}/" install
}
