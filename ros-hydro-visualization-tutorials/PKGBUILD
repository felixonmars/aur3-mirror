
pkgdesc="ROS - Metapackage referencing tutorials related to rviz and visualization."
url='http://www.ros.org/'

pkgname='ros-hydro-visualization-tutorials'
pkgver='0.8.4'
_pkgver_patch=0
arch=('i686' 'x86_64')
pkgrel=1
license=('BSD')
makedepends=('cmake' 'git' 'ros-build-tools')

ros_depends=(ros-hydro-rviz-python-tutorial
  ros-hydro-rviz-plugin-tutorials
  ros-hydro-interactive-marker-tutorials
  ros-hydro-visualization-marker-tutorials
  ros-hydro-librviz-tutorial)
depends=(${ros_depends[@]})

_tag=release/hydro/visualization_tutorials/${pkgver}-${_pkgver_patch}
_dir=visualization_tutorials
source=("${_dir}"::"git+https://github.com/ros-gbp/visualization_tutorials-release.git"#tag=${_tag})
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
