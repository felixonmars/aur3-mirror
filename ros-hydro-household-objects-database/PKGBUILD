# Script generated with import_catkin_packages.py
# For more information: https://github.com/bchretien/arch-ros-stacks
pkgdesc="ROS - Class definitions and a few convenience functions for interfacing with a specific SQL database, containing 3D models of a set of common household objects."
url='http://www.ros.org/'

pkgname='ros-hydro-household-objects-database'
pkgver='0.1.4'
_pkgver_patch=0
arch=('any')
pkgrel=1
license=('BSD')

ros_makedepends=(ros-hydro-household-objects-database-msgs
  ros-hydro-roscpp
  ros-hydro-manipulation-msgs
  ros-hydro-catkin
  ros-hydro-actionlib
  ros-hydro-tf
  ros-hydro-sql-database)
makedepends=('cmake' 'git' 'ros-build-tools'
  ${ros_makedepends[@]})

ros_depends=(ros-hydro-roslib
  ros-hydro-actionlib
  ros-hydro-rospy
  ros-hydro-rosservice
  ros-hydro-roscpp
  ros-hydro-manipulation-msgs
  ros-hydro-rosgraph
  ros-hydro-household-objects-database-msgs
  ros-hydro-sql-database)
depends=(${ros_depends[@]})

_tag=release/hydro/household_objects_database/${pkgver}-${_pkgver_patch}
_dir=household_objects_database
source=("${_dir}"::"git+https://github.com/ros-gbp/household_objects_database-release.git"#tag=${_tag})
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
