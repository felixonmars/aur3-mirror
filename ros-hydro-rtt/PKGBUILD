
pkgdesc="ROS - Orocos/RTT component framework."
url='http://www.ros.org/'

pkgname='ros-hydro-rtt'
pkgver='2.7.0'
_pkgver_patch=7
arch=('i686' 'x86_64')
pkgrel=1
license=('GPL v2 with linking exception')

ros_makedepends=(ros-hydro-catkin)
makedepends=('cmake' 'git' 'ros-build-tools'
  ${ros_makedepends[@]}
  perl-xml-xpath
  boost
  omniorb
  pkg-config)

ros_depends=(ros-hydro-catkin)
depends=(${ros_depends[@]}
  perl-xml-xpath
  boost
  omniorb
  pkg-config)

_tag=release/hydro/rtt/${pkgver}-${_pkgver_patch}
_dir=rtt
source=("${_dir}"::"git+https://github.com/orocos-gbp/rtt-release.git"#tag=${_tag})
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
