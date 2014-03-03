
pkgdesc="ROS - Unofficial driver and ROS node for Razer Hydra."
url='http://www.ros.org/'

pkgname='ros-hydro-razer-hydra'
pkgver='0.0.12'
_pkgver_patch=0
arch=('i686' 'x86_64')
pkgrel=1
license=('')

ros_makedepends=(ros-hydro-tf
  ros-hydro-roscpp
  ros-hydro-message-generation
  ros-hydro-catkin
  ros-hydro-geometry-msgs)
makedepends=('cmake' 'git' 'ros-build-tools'
  ${ros_makedepends[@]}
  libusbx
  pkg-config)

ros_depends=(ros-hydro-tf
  ros-hydro-roscpp
  ros-hydro-geometry-msgs
  ros-hydro-message-runtime)
depends=(${ros_depends[@]}
  libusbx
  pkg-config)

_tag=release/hydro/razer_hydra/${pkgver}-${_pkgver_patch}
_dir=razer_hydra
source=("${_dir}"::"git+https://github.com/ros-gbp/razer_hydra-release.git"#tag=${_tag})
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
