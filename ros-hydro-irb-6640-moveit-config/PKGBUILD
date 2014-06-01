# Script generated with import_catkin_packages.py
# For more information: https://github.com/bchretien/arch-ros-stacks
pkgdesc="ROS - An automatically generated package with all the configuration and launch files for using the irb_6640 with the MoveIt Motion Planning Framework."
url='http://moveit.ros.org/'

pkgname='ros-hydro-irb-6640-moveit-config'
pkgver='1.1.1'
_pkgver_patch=0
arch=('any')
pkgrel=1
license=('BSD')

ros_makedepends=(ros-hydro-abb-common
  ros-hydro-catkin)
makedepends=('cmake' 'git' 'ros-build-tools'
  ${ros_makedepends[@]})

ros_depends=(ros-hydro-moveit-ros-move-group
  ros-hydro-industrial-robot-simulator
  ros-hydro-moveit-planners-ompl
  ros-hydro-abb-common
  ros-hydro-moveit-simple-controller-manager
  ros-hydro-robot-state-publisher
  ros-hydro-moveit-ros-visualization
  ros-hydro-xacro
  ros-hydro-joint-state-publisher)
depends=(${ros_depends[@]})

_tag=release/hydro/irb_6640_moveit_config/${pkgver}-${_pkgver_patch}
_dir=irb_6640_moveit_config
source=("${_dir}"::"git+https://github.com/ros-industrial-release/abb-release.git"#tag=${_tag})
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
