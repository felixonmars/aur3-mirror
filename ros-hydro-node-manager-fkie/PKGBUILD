# Script generated with import_catkin_packages.py
# For more information: https://github.com/bchretien/arch-ros-stacks
pkgdesc="ROS - Graphical interface, written in PySide, to manage the running and configured ROS nodes on different hosts."
url='http://ros.org/wiki/node_manager_fkie'

pkgname='ros-hydro-node-manager-fkie'
pkgver='0.3.10'
_pkgver_patch=0
arch=('any')
pkgrel=1
license=('BSD, LGPL, CC')

ros_makedepends=(ros-hydro-master-discovery-fkie
  ros-hydro-catkin
  ros-hydro-multimaster-msgs-fkie)
makedepends=('cmake' 'git' 'ros-build-tools'
  ${ros_makedepends[@]})

ros_depends=(ros-hydro-multimaster-msgs-fkie
  ros-hydro-rospy
  ros-hydro-rqt-reconfigure
  ros-hydro-master-sync-fkie
  ros-hydro-rosservice
  ros-hydro-rqt-gui
  ros-hydro-python-qt-binding
  ros-hydro-roslib
  ros-hydro-rosgraph
  ros-hydro-rosmsg
  ros-hydro-default-cfg-fkie
  ros-hydro-master-discovery-fkie
  ros-hydro-roslaunch
  ros-hydro-dynamic-reconfigure)
depends=(${ros_depends[@]}
  screen
  xterm
  python2-paramiko
  python2-docutils)

_tag=release/hydro/node_manager_fkie/${pkgver}-${_pkgver_patch}
_dir=node_manager_fkie
source=("${_dir}"::"git+https://github.com/fkie-release/multimaster_fkie-release.git"#tag=${_tag})
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
