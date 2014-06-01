# Script generated with import_catkin_packages.py
# For more information: https://github.com/bchretien/arch-ros-stacks
pkgdesc="ROS - Outputs audio to a speaker from a source node."
url='http://ros.org/wiki/audio_play'

pkgname='ros-hydro-audio-play'
pkgver='0.2.6'
_pkgver_patch=0
arch=('any')
pkgrel=1
license=('BSD')

ros_makedepends=(ros-hydro-roscpp
  ros-hydro-audio-common-msgs
  ros-hydro-catkin)
makedepends=('cmake' 'git' 'ros-build-tools'
  ${ros_makedepends[@]}
  gstreamer0.10-base-plugins
  gstreamer0.10)

ros_depends=(ros-hydro-roscpp
  ros-hydro-audio-common-msgs)
depends=(${ros_depends[@]}
  gstreamer0.10-ugly-plugins
  gstreamer0.10-good-plugins
  gstreamer0.10-base-plugins
  gstreamer0.10)

_tag=release/hydro/audio_play/${pkgver}-${_pkgver_patch}
_dir=audio_play
source=("${_dir}"::"git+https://github.com/ros-gbp/audio_common-release.git"#tag=${_tag})
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
