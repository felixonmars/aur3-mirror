# Script generated with import_catkin_packages.py
# For more information: https://github.com/bchretien/arch-ros-stacks
pkgdesc="ROS - The pr2_moveit_tutorials package."
url='http://www.ros.org/'

pkgname='ros-hydro-pr2-moveit-tutorials'
pkgver='0.5.6'
_pkgver_patch=0
arch=('any')
pkgrel=1
license=('BSD')

ros_makedepends=(ros-hydro-moveit-ros-planning-interface
  ros-hydro-interactive-markers
  ros-hydro-catkin
  ros-hydro-moveit-core
  ros-hydro-moveit-ros-perception
  ros-hydro-pluginlib)
makedepends=('cmake' 'git' 'ros-build-tools'
  ${ros_makedepends[@]})

ros_depends=(ros-hydro-moveit-ros-planning-interface
  ros-hydro-interactive-markers
  ros-hydro-moveit-core
  ros-hydro-moveit-ros-perception
  ros-hydro-pluginlib)
depends=(${ros_depends[@]})

_tag=release/hydro/pr2_moveit_tutorials/${pkgver}-${_pkgver_patch}
_dir=pr2_moveit_tutorials
source=("${_dir}"::"git+https://github.com/ros-gbp/moveit_pr2-release.git"#tag=${_tag})
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
