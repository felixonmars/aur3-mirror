# Script generated with import_catkin_packages.py
# For more information: https://github.com/bchretien/arch-ros-stacks
pkgdesc="ROS - An automatically generated package with all the configuration and launch files for using the ur10 with the MoveIt Motion Planning Framework."
url='http://moveit.ros.org/'

pkgname='ros-hydro-ur10-moveit-config'
pkgver='1.0.2'
_pkgver_patch=1
arch=('any')
pkgrel=2
license=('BSD')

ros_makedepends=(ros-hydro-catkin
  ros-hydro-ur-description)
makedepends=('cmake' 'git' 'ros-build-tools'
  ${ros_makedepends[@]})

ros_depends=(ros-hydro-moveit-ros-move-group
  ros-hydro-moveit-planners-ompl
  ros-hydro-ur-description
  ros-hydro-robot-state-publisher
  ros-hydro-moveit-ros-visualization
  ros-hydro-xacro
  ros-hydro-joint-state-publisher)
depends=(${ros_depends[@]})

_tag=release/hydro/ur10_moveit_config/${pkgver}-${_pkgver_patch}
_dir=ur10_moveit_config
source=("${_dir}"::"git+https://github.com/ros-industrial-release/universal_robot-release.git"#tag=${_tag})
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
