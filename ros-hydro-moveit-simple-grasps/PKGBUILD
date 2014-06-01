# Script generated with import_catkin_packages.py
# For more information: https://github.com/bchretien/arch-ros-stacks
pkgdesc="ROS - moveit_simple_grasps generates grasps for picking up simple objects."
url='https://github.com/davetcoleman/simple_grasps/'

pkgname='ros-hydro-moveit-simple-grasps'
pkgver='1.0.1'
_pkgver_patch=0
arch=('any')
pkgrel=1
license=('BSD')

ros_makedepends=(ros-hydro-moveit-ros-planning
  ros-hydro-eigen-conversions
  ros-hydro-message-generation
  ros-hydro-actionlib-msgs
  ros-hydro-tf-conversions
  ros-hydro-trajectory-msgs
  ros-hydro-moveit-msgs
  ros-hydro-moveit-visual-tools
  ros-hydro-roscpp
  ros-hydro-geometry-msgs
  ros-hydro-catkin
  ros-hydro-actionlib
  ros-hydro-moveit-core
  ros-hydro-tf
  ros-hydro-cmake-modules
  ros-hydro-moveit-ros-planning-interface
  ros-hydro-std-msgs)
makedepends=('cmake' 'git' 'ros-build-tools'
  ${ros_makedepends[@]})

ros_depends=(ros-hydro-trajectory-msgs
  ros-hydro-moveit-msgs
  ros-hydro-moveit-visual-tools
  ros-hydro-geometry-msgs
  ros-hydro-message-runtime
  ros-hydro-actionlib-msgs
  ros-hydro-std-msgs)
depends=(${ros_depends[@]})

_tag=release/hydro/moveit_simple_grasps/${pkgver}-${_pkgver_patch}
_dir=moveit_simple_grasps
source=("${_dir}"::"git+https://github.com/davetcoleman/moveit_simple_grasps-release.git"#tag=${_tag})
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
