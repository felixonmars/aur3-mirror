# Script generated with import_catkin_packages.py
# For more information: https://github.com/bchretien/arch-ros-stacks
pkgdesc="ROS - Helper functions for displaying and debugging MoveIt! data in Rviz via published markers."
url='https://github.com/davetcoleman/moveit_visual_tools'

pkgname='ros-hydro-moveit-visual-tools'
pkgver='1.0.1'
_pkgver_patch=0
arch=('any')
pkgrel=1
license=('BSD')

ros_makedepends=(ros-hydro-eigen-conversions
  ros-hydro-graph-msgs
  ros-hydro-tf-conversions
  ros-hydro-trajectory-msgs
  ros-hydro-moveit-msgs
  ros-hydro-roscpp
  ros-hydro-geometry-msgs
  ros-hydro-catkin
  ros-hydro-moveit-core
  ros-hydro-cmake-modules
  ros-hydro-visualization-msgs
  ros-hydro-std-msgs
  ros-hydro-moveit-ros-robot-interaction)
makedepends=('cmake' 'git' 'ros-build-tools'
  ${ros_makedepends[@]})

ros_depends=(ros-hydro-graph-msgs
  ros-hydro-trajectory-msgs
  ros-hydro-moveit-msgs
  ros-hydro-geometry-msgs
  ros-hydro-moveit-core
  ros-hydro-visualization-msgs
  ros-hydro-std-msgs
  ros-hydro-moveit-ros-robot-interaction)
depends=(${ros_depends[@]})

_tag=release/hydro/moveit_visual_tools/${pkgver}-${_pkgver_patch}
_dir=moveit_visual_tools
source=("${_dir}"::"git+https://github.com/davetcoleman/moveit_visual_tools-release.git"#tag=${_tag})
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
