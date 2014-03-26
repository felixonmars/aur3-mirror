
pkgdesc="ROS - The pluginlib package provides tools for writing and dynamically loading plugins using the ROS build infrastructure."
url='http://www.ros.org/'

pkgname='ros-hydro-pluginlib'
pkgver='1.9.24'
_pkgver_patch=0
arch=('i686' 'x86_64')
pkgrel=1
license=('BSD, Boost Software License')

ros_makedepends=(ros-hydro-class-loader
  ros-hydro-roslib
  ros-hydro-catkin
  ros-hydro-rosconsole)
makedepends=('cmake' 'git' 'ros-build-tools'
  ${ros_makedepends[@]}
  boost
  tinyxml)

ros_depends=(ros-hydro-class-loader
  ros-hydro-roslib
  ros-hydro-rosconsole)
depends=(${ros_depends[@]}
  boost
  tinyxml)

_tag=release/hydro/pluginlib/${pkgver}-${_pkgver_patch}
_dir=pluginlib
source=("${_dir}"::"git+https://github.com/ros-gbp/pluginlib-release.git"#tag=${_tag})
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
