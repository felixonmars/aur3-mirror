
pkgdesc="ROS - Wraps the ViSP moving edge tracker provided by the ViSP visual servoing library into a ROS package."
url='http://www.ros.org/'

pkgname='ros-hydro-visp-tracker'
pkgver='0.7.0'
_pkgver_patch=0
arch=('i686' 'x86_64')
pkgrel=1
license=('BSD')

ros_makedepends=(ros-hydro-message-generation
  ros-hydro-rospy
  ros-hydro-sensor-msgs
  ros-hydro-nodelet
  ros-hydro-roscpp
  ros-hydro-geometry-msgs
  ros-hydro-catkin
  ros-hydro-dynamic-reconfigure
  ros-hydro-std-msgs)
makedepends=('cmake' 'git' 'ros-build-tools'
  ${ros_makedepends[@]}
  bullet)

ros_depends=(ros-hydro-message-generation
  ros-hydro-rospy
  ros-hydro-message-runtime
  ros-hydro-sensor-msgs
  ros-hydro-nodelet
  ros-hydro-roscpp
  ros-hydro-geometry-msgs
  ros-hydro-dynamic-reconfigure
  ros-hydro-std-msgs)
depends=(${ros_depends[@]}
  bullet)

_tag=release/hydro/visp_tracker/${pkgver}-${_pkgver_patch}
_dir=visp_tracker
source=("${_dir}"::"git+https://github.com/lagadic/vision_visp-release.git"#tag=${_tag}
        "boost.patch")
md5sums=('SKIP'
         'd9f4d6426c503472552eeb164e8c8752')

build() {
  # Use ROS environment variables
  /usr/share/ros-build-tools/clear-ros-env.sh
  [ -f /opt/ros/hydro/setup.bash ] && source /opt/ros/hydro/setup.bash

  # Apply patch
  msg "Patching source code"
  cd ${srcdir}/${_dir}
  git apply ${srcdir}/boost.patch

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
