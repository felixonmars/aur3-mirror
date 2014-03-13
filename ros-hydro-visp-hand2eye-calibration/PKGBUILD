
pkgdesc="ROS - visp_hand2eye_calibration estimates the camera position with respect to its effector using the ViSP library."
url='http://www.ros.org/'

pkgname='ros-hydro-visp-hand2eye-calibration'
pkgver='0.7.0'
_pkgver_patch=0
arch=('i686' 'x86_64')
pkgrel=1
license=('GPLv2')

ros_makedepends=(ros-hydro-message-generation
  ros-hydro-visp-bridge
  ros-hydro-catkin
  ros-hydro-image-proc)
makedepends=('cmake' 'git' 'ros-build-tools'
  ${ros_makedepends[@]})

ros_depends=(ros-hydro-message-generation
  ros-hydro-visp-bridge
  ros-hydro-image-proc)
depends=(${ros_depends[@]})

_tag=release/hydro/visp_hand2eye_calibration/${pkgver}-${_pkgver_patch}
_dir=visp_hand2eye_calibration
source=("${_dir}"::"git+https://github.com/lagadic/vision_visp-release.git"#tag=${_tag})
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
