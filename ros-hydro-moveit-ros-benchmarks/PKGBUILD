# Script generated with import_catkin_packages.py
# For more information: https://github.com/bchretien/arch-ros-stacks
pkgdesc="ROS - MoveIt tools for benchmarking."
url='http://moveit.ros.org'

pkgname='ros-hydro-moveit-ros-benchmarks'
pkgver='0.5.16'
_pkgver_patch=0
arch=('any')
pkgrel=1
license=('BSD')

ros_makedepends=(ros-hydro-moveit-ros-planning
  ros-hydro-eigen-conversions
  ros-hydro-rosconsole
  ros-hydro-moveit-ros-warehouse
  ros-hydro-roscpp
  ros-hydro-catkin)
makedepends=('cmake' 'git' 'ros-build-tools'
  ${ros_makedepends[@]})

ros_depends=(ros-hydro-moveit-ros-planning
  ros-hydro-moveit-ros-warehouse
  ros-hydro-rosconsole
  ros-hydro-roscpp
  ros-hydro-eigen-conversions)
depends=(${ros_depends[@]})

_tag=release/hydro/moveit_ros_benchmarks/${pkgver}-${_pkgver_patch}
_dir=moveit_ros_benchmarks
source=("${_dir}"::"git+https://github.com/ros-gbp/moveit_ros-release.git"#tag=${_tag}
        'boost.patch')
md5sums=('SKIP'
         'b3d7d6e53ea455339058a6d30983393a')

build() {
  # Use ROS environment variables
  /usr/share/ros-build-tools/clear-ros-env.sh
  [ -f /opt/ros/hydro/setup.bash ] && source /opt/ros/hydro/setup.bash

  # Apply patch
  msg "Patching source code"
  cd ${srcdir}/${_dir}
  git apply ${srcdir}/boost.patch

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
