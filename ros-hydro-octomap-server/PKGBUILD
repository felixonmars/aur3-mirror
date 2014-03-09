
pkgdesc="ROS - octomap_server loads a 3D map (as Octree-based OctoMap) and distributes it to other nodes in a compact binary format."
url='http://www.ros.org/'

pkgname='ros-hydro-octomap-server'
pkgver='0.5.3'
_pkgver_patch=0
arch=('i686' 'x86_64')
pkgrel=1
license=('BSD')

ros_makedepends=(ros-hydro-std-srvs
  ros-hydro-octomap-ros
  ros-hydro-octomap-msgs
  ros-hydro-sensor-msgs
  ros-hydro-nodelet
  ros-hydro-roscpp
  ros-hydro-catkin
  ros-hydro-std-msgs
  ros-hydro-nav-msgs
  ros-hydro-visualization-msgs
  ros-hydro-dynamic-reconfigure
  ros-hydro-pcl-ros
  ros-hydro-pcl-conversions
  ros-hydro-octomap)
makedepends=('cmake' 'git' 'ros-build-tools'
  ${ros_makedepends[@]}
  pcl)

ros_depends=(ros-hydro-std-srvs
  ros-hydro-octomap-ros
  ros-hydro-octomap-msgs
  ros-hydro-sensor-msgs
  ros-hydro-nodelet
  ros-hydro-roscpp
  ros-hydro-std-msgs
  ros-hydro-nav-msgs
  ros-hydro-visualization-msgs
  ros-hydro-dynamic-reconfigure
  ros-hydro-pcl-ros
  ros-hydro-pcl-conversions
  ros-hydro-octomap)
depends=(${ros_depends[@]}
  pcl)

_tag=release/hydro/octomap_server/${pkgver}-${_pkgver_patch}
_dir=octomap_server
source=("${_dir}"::"git+https://github.com/ros-gbp/octomap_mapping-release.git"#tag=${_tag})
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
