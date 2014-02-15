
pkgdesc="ROS - The nao_robot stack contains some useful nodes to integrated the Nao humanoid robot into ROS, developed at the Humanoid Robots Lab at the Albert-Ludwigs-Unversitaet in Freiburg, Germany."
url='http://www.ros.org/'

pkgname='ros-hydro-nao-robot'
pkgver='0.2.2'
_pkgver_patch=0
arch=('i686' 'x86_64')
pkgrel=1
license=('BSD')

ros_makedepends=(ros-hydro-catkin)
makedepends=('cmake' 'git' 'ros-build-tools'
  ${ros_makedepends[@]})

ros_depends=(ros-hydro-nao-description
  ros-hydro-nao-bringup
  ros-hydro-nao-driver
  ros-hydro-nao-pose
  ros-hydro-nao-msgs)
depends=(${ros_depends[@]})

_tag=release/hydro/nao_robot/${pkgver}-${_pkgver_patch}
_dir=nao_robot
source=("${_dir}"::"git+https://github.com/ros-gbp/nao_robot-release"#tag=${_tag})
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
