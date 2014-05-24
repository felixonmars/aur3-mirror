# Script generated with import_catkin_packages.py
# For more information: https://github.com/bchretien/arch-ros-stacks
pkgdesc="ROS - C++ driver library for Kobuki: Pure C++ driver library for Kobuki."
url='http://ros.org/wiki/kobuki_driver'

pkgname='ros-hydro-kobuki-driver'
pkgver='0.5.4'
_pkgver_patch=0
arch=('any')
pkgrel=1
license=('BSD')

ros_makedepends=(ros-hydro-ecl-devices
  ros-hydro-ecl-sigslots
  ros-hydro-ecl-converters
  ros-hydro-catkin
  ros-hydro-ecl-mobile-robot
  ros-hydro-ecl-geometry
  ros-hydro-ecl-time
  ros-hydro-ecl-command-line)
makedepends=('cmake' 'git' 'ros-build-tools'
  ${ros_makedepends[@]})

ros_depends=(ros-hydro-ecl-devices
  ros-hydro-ecl-sigslots
  ros-hydro-ecl-converters
  ros-hydro-ecl-mobile-robot
  ros-hydro-ecl-geometry
  ros-hydro-ecl-time
  ros-hydro-ecl-command-line)
depends=(${ros_depends[@]})

_tag=release/hydro/kobuki_driver/${pkgver}-${_pkgver_patch}
_dir=kobuki_driver
source=("${_dir}"::"git+https://github.com/yujinrobot-release/kobuki_core-release.git"#tag=${_tag})
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
