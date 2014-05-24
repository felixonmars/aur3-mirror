# Script generated with import_catkin_packages.py
# For more information: https://github.com/bchretien/arch-ros-stacks
pkgdesc="ROS - Contains transforms for the various types of mobile robot platforms."
url='http://wiki.ros.org/ecl_mobile_robot'

pkgname='ros-hydro-ecl-mobile-robot'
pkgver='0.60.0'
_pkgver_patch=2
arch=('any')
pkgrel=1
license=('BSD')

ros_makedepends=(ros-hydro-ecl-math
  ros-hydro-ecl-license
  ros-hydro-ecl-formatters
  ros-hydro-catkin
  ros-hydro-ecl-errors
  ros-hydro-ecl-linear-algebra
  ros-hydro-ecl-geometry)
makedepends=('cmake' 'git' 'ros-build-tools'
  ${ros_makedepends[@]})

ros_depends=(ros-hydro-ecl-math
  ros-hydro-ecl-license
  ros-hydro-ecl-formatters
  ros-hydro-ecl-errors
  ros-hydro-ecl-linear-algebra
  ros-hydro-ecl-geometry)
depends=(${ros_depends[@]})

_tag=release/hydro/ecl_mobile_robot/${pkgver}-${_pkgver_patch}
_dir=ecl_mobile_robot
source=("${_dir}"::"git+https://github.com/yujinrobot-release/ecl_navigation-release.git"#tag=${_tag})
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
