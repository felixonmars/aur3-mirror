# Script generated with import_catkin_packages.py
# For more information: https://github.com/bchretien/arch-ros-stacks
pkgdesc="ROS - This package provides implementations of the Trajectory Rollout and Dynamic Window approaches to local robot navigation on a plane."
url='http://wiki.ros.org/base_local_planner'

pkgname='ros-hydro-base-local-planner'
pkgver='1.11.11'
_pkgver_patch=0
arch=('any')
pkgrel=1
license=('BSD')

ros_makedepends=(ros-hydro-message-generation
  ros-hydro-rosconsole
  ros-hydro-rospy
  ros-hydro-tf
  ros-hydro-dynamic-reconfigure
  ros-hydro-costmap-2d
  ros-hydro-roscpp
  ros-hydro-angles
  ros-hydro-catkin
  ros-hydro-nav-core
  ros-hydro-nav-msgs
  ros-hydro-cmake-modules
  ros-hydro-visualization-msgs
  ros-hydro-pcl-conversions
  ros-hydro-voxel-grid
  ros-hydro-geometry-msgs
  ros-hydro-pcl-ros
  ros-hydro-std-msgs
  ros-hydro-pluginlib)
makedepends=('cmake' 'git' 'ros-build-tools'
  ${ros_makedepends[@]}
  eigen3)

ros_depends=(ros-hydro-message-generation
  ros-hydro-rosconsole
  ros-hydro-rospy
  ros-hydro-geometry-msgs
  ros-hydro-costmap-2d
  ros-hydro-roscpp
  ros-hydro-angles
  ros-hydro-nav-core
  ros-hydro-nav-msgs
  ros-hydro-tf
  ros-hydro-visualization-msgs
  ros-hydro-dynamic-reconfigure
  ros-hydro-voxel-grid
  ros-hydro-pcl-ros
  ros-hydro-std-msgs
  ros-hydro-pluginlib)
depends=(${ros_depends[@]}
  eigen3)

_tag=release/hydro/base_local_planner/${pkgver}-${_pkgver_patch}
_dir=base_local_planner
source=("${_dir}"::"git+https://github.com/ros-gbp/navigation-release.git"#tag=${_tag})
md5sums=('SKIP')

build() {
  # Use ROS environment variables
  source /usr/share/ros-build-tools/clear-ros-env.sh
  [ -f /opt/ros/hydro/setup.bash ] && source /opt/ros/hydro/setup.bash

  # Create build directory
  [ -d ${srcdir}/build ] || mkdir ${srcdir}/build
  cd ${srcdir}/build

  # Fix Python2/Python3 conflicts
  /usr/share/ros-build-tools/fix-python-scripts.sh -v 2 ${srcdir}/${_dir}

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
