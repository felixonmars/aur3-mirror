
pkgdesc="ROS - Multi-robot teleoperation package collection."
url='http://www.ros.org/'

pkgname='ros-hydro-mr-rqt'
pkgver='0.2.6'
_pkgver_patch=1
arch=('i686' 'x86_64')
pkgrel=2
license=('MIT')

ros_makedepends=(ros-hydro-rqt-gui-cpp
  ros-hydro-rqt-gui
  ros-hydro-roscpp
  ros-hydro-geometry-msgs
  ros-hydro-catkin
  ros-hydro-std-msgs
  ros-hydro-pluginlib)
makedepends=('cmake' 'git' 'ros-build-tools'
  ${ros_makedepends[@]})

ros_depends=(ros-hydro-rqt-gui-cpp
  ros-hydro-rqt-gui
  ros-hydro-roscpp
  ros-hydro-geometry-msgs
  ros-hydro-std-msgs
  ros-hydro-pluginlib)
depends=(${ros_depends[@]})

_tag=release/hydro/mr_rqt/${pkgver}-${_pkgver_patch}
_dir=mr_rqt
source=("${_dir}"::"git+https://github.com/cogniteam/mr_teleoperator-release"#tag=${_tag}
        "q_moc_run.patch")
md5sums=('SKIP'
         '317a3f2db5ee8e6b35ca42e6f063baaf')

prepare() {
  cd ${_dir}
  patch -p1 -i ${srcdir}/q_moc_run.patch
}

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
