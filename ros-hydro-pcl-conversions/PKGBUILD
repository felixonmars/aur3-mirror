# Script generated with import_catkin_packages.py
# For more information: https://github.com/bchretien/arch-ros-stacks
pkgdesc="ROS - Provides conversions from PCL data types and ROS message types."
url='http://www.ros.org/'

pkgname='ros-hydro-pcl-conversions'
pkgver='0.1.6'
_pkgver_patch=0
arch=('any')
pkgrel=1
license=('BSD')

ros_makedepends=(ros-hydro-catkin
  ros-hydro-roscpp
  ros-hydro-sensor-msgs
  ros-hydro-pcl-msgs
  ros-hydro-std-msgs)
makedepends=('cmake' 'git' 'ros-build-tools'
  ${ros_makedepends[@]}
  'pcl>=1.7')

ros_depends=(ros-hydro-roscpp
  ros-hydro-sensor-msgs
  ros-hydro-pcl-msgs
  ros-hydro-std-msgs)
depends=(${ros_depends[@]}
  'pcl>=1.7')

_tag=release/hydro/pcl_conversions/${pkgver}-${_pkgver_patch}
_dir=pcl_conversions
source=("${_dir}"::"git+https://github.com/ros-gbp/pcl_conversions-release.git"#tag=${_tag})
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
