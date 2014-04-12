# Script generated with import_catkin_packages.py
# For more information: https://github.com/bchretien/arch-ros-stacks
pkgdesc="ROS - PCL (Point Cloud Library) ROS interface stack."
url='http://www.ros.org/'

pkgname='ros-hydro-pcl-ros'
pkgver='1.1.8'
_pkgver_patch=0
arch=('any')
pkgrel=1
license=('BSD')

ros_makedepends=(ros-hydro-pcl-msgs
  ros-hydro-rosbag
  ros-hydro-sensor-msgs
  ros-hydro-nodelet
  ros-hydro-tf
  ros-hydro-roscpp
  ros-hydro-catkin
  ros-hydro-std-msgs
  ros-hydro-nodelet-topic-tools
  ros-hydro-dynamic-reconfigure
  ros-hydro-pcl-conversions
  ros-hydro-pluginlib)
makedepends=('cmake' 'git' 'ros-build-tools'
  ${ros_makedepends[@]}
  eigen3
  'pcl>=1.7')

ros_depends=(ros-hydro-pcl-msgs
  ros-hydro-rosbag
  ros-hydro-sensor-msgs
  ros-hydro-nodelet
  ros-hydro-tf
  ros-hydro-roscpp
  ros-hydro-std-msgs
  ros-hydro-nodelet-topic-tools
  ros-hydro-message-filters
  ros-hydro-dynamic-reconfigure
  ros-hydro-pcl-conversions
  ros-hydro-pluginlib)
depends=(${ros_depends[@]}
  eigen3
  'pcl>=1.7')

_tag=release/hydro/pcl_ros/${pkgver}-${_pkgver_patch}
_dir=pcl_ros
source=("${_dir}"::"git+https://github.com/ros-gbp/perception_pcl-release.git"#tag=${_tag})
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
