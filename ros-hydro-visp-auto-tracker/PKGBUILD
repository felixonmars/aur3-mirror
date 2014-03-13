
pkgdesc="ROS - Online automated pattern-based object tracker relying on visual servoing."
url='http://www.ros.org/'

pkgname='ros-hydro-visp-auto-tracker'
pkgver='0.7.0'
_pkgver_patch=0
arch=('i686' 'x86_64')
pkgrel=1
license=('GPLv2')

ros_makedepends=(ros-hydro-visp-tracker
  ros-hydro-visp-bridge
  ros-hydro-catkin)
makedepends=('cmake' 'git' 'ros-build-tools'
  ${ros_makedepends[@]}
  zbar
  libdmtx)

ros_depends=(ros-hydro-visp-tracker
  ros-hydro-visp-bridge)
depends=(${ros_depends[@]}
  zbar
  libdmtx)

_tag=release/hydro/visp_auto_tracker/${pkgver}-${_pkgver_patch}
_dir=visp_auto_tracker
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
