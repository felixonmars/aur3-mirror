
pkgdesc="ROS - Drivers for the Asus Xtion and Primesense Devices."
url='http://www.ros.org/'

pkgname='ros-hydro-openni2-camera'
pkgver='0.1.1'
_pkgver_patch=0
arch=('i686' 'x86_64')
pkgrel=1
license=('BSD')

ros_makedepends=(ros-hydro-sensor-msgs
  ros-hydro-nodelet
  ros-hydro-camera-info-manager
  ros-hydro-image-transport
  ros-hydro-roscpp
  ros-hydro-catkin
  ros-hydro-dynamic-reconfigure)
makedepends=('cmake' 'git' 'ros-build-tools'
  ${ros_makedepends[@]}
  openni2)

ros_depends=(ros-hydro-sensor-msgs
  ros-hydro-nodelet
  ros-hydro-camera-info-manager
  ros-hydro-image-transport
  ros-hydro-roscpp
  ros-hydro-dynamic-reconfigure)
depends=(${ros_depends[@]}
  openni2)

_tag=release/hydro/openni2_camera/${pkgver}-${_pkgver_patch}
_dir=openni2_camera
source=("${_dir}"::"git+https://github.com/ros-gbp/openni2_camera-release.git"#tag=${_tag}
        cmake.patch)
md5sums=('SKIP'
         '439624edbc7235c4f0c9fa1bd2021603')

build() {
  # Use ROS environment variables
  /usr/share/ros-build-tools/clear-ros-env.sh
  [ -f /opt/ros/hydro/setup.bash ] && source /opt/ros/hydro/setup.bash

  # Patch source code
  msg "Patching source code"
  cd ${srcdir}/${_dir}
  git apply ${srcdir}/cmake.patch

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
