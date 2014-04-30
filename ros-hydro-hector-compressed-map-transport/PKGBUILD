# Script generated with import_catkin_packages.py
# For more information: https://github.com/bchretien/arch-ros-stacks
pkgdesc="ROS - hector_compressed_map_transport provides means for transporting compressed map data through the use of image_transport."
url='http://ros.org/wiki/hector_compressed_map_transport'

pkgname='ros-hydro-hector-compressed-map-transport'
pkgver='0.3.2'
_pkgver_patch=0
arch=('any')
pkgrel=1
license=('BSD')

ros_makedepends=(ros-hydro-cv-bridge
  ros-hydro-sensor-msgs
  ros-hydro-image-transport
  ros-hydro-catkin
  ros-hydro-geometry-msgs
  ros-hydro-opencv2
  ros-hydro-nav-msgs
  ros-hydro-hector-map-tools)
makedepends=('cmake' 'git' 'ros-build-tools'
  ${ros_makedepends[@]}
  eigen3)

ros_depends=(ros-hydro-cv-bridge
  ros-hydro-sensor-msgs
  ros-hydro-image-transport
  ros-hydro-geometry-msgs
  ros-hydro-opencv2
  ros-hydro-nav-msgs
  ros-hydro-hector-map-tools)
depends=(${ros_depends[@]}
  eigen3)

_tag=release/hydro/hector_compressed_map_transport/${pkgver}-${_pkgver_patch}
_dir=hector_compressed_map_transport
source=("${_dir}"::"git+https://github.com/tu-darmstadt-ros-pkg-gbp/hector_slam-release.git"#tag=${_tag})
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
