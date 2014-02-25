
pkgdesc="ROS - This package contains generic definitions of geometric shapes and bodies."
url='http://www.ros.org/'

pkgname='ros-hydro-geometric-shapes'
pkgver='0.3.6'
_pkgver_patch=0
arch=('i686' 'x86_64')
pkgrel=1
license=('BSD')

ros_makedepends=(ros-hydro-shape-msgs
  ros-hydro-resource-retriever
  ros-hydro-eigen-stl-containers
  ros-hydro-octomap
  ros-hydro-catkin
  ros-hydro-shape-tools
  ros-hydro-console-bridge
  ros-hydro-random-numbers)
makedepends=('cmake' 'git' 'ros-build-tools'
  ${ros_makedepends[@]}
  qhull
  boost
  eigen3
  assimp)

ros_depends=(ros-hydro-shape-msgs
  ros-hydro-resource-retriever
  ros-hydro-eigen-stl-containers
  ros-hydro-octomap
  ros-hydro-shape-tools
  ros-hydro-console-bridge
  ros-hydro-random-numbers)
depends=(${ros_depends[@]}
  assimp
  boost
  eigen3
  qhull)

_tag=release/hydro/geometric_shapes/${pkgver}-${_pkgver_patch}
_dir=geometric_shapes
source=("${_dir}"::"git+https://github.com/ros-gbp/geometric_shapes-release.git"#tag=${_tag})
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
