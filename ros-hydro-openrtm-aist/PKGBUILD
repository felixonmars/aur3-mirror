# Script generated with import_catkin_packages.py
# For more information: https://github.com/bchretien/arch-ros-stacks
pkgdesc="ROS - This package represents OpenRTM-aist thats built within ROS eco system."
url='http://ros.org/wiki/openrtm_aist'

pkgname='ros-hydro-openrtm-aist'
pkgver='1.1.0'
_pkgver_patch=7
arch=('any')
pkgrel=1
license=('EPL')

ros_makedepends=(ros-hydro-catkin
  ros-hydro-rosbash
  ros-hydro-mk
  ros-hydro-rosbuild
  ros-hydro-rostest)
makedepends=('cmake' 'git' 'ros-build-tools'
  ${ros_makedepends[@]}
  util-linux
  unzip
  omniorb)

ros_depends=(ros-hydro-rosbash)
depends=(${ros_depends[@]}
  util-linux
  omniorb)

_tag=release/hydro/openrtm_aist/${pkgver}-${_pkgver_patch}
_dir=openrtm_aist
source=("${_dir}"::"git+https://github.com/tork-a/openrtm_aist_core-release.git"#tag=${_tag})
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
