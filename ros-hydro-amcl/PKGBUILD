# Script generated with import_catkin_packages.py
# For more information: https://github.com/bchretien/arch-ros-stacks
pkgdesc="ROS -  amcl is a probabilistic localization system for a robot moving in 2D."
url='http://wiki.ros.org/amcl'

pkgname='ros-hydro-amcl'
pkgver='1.11.11'
_pkgver_patch=0
arch=('any')
pkgrel=1
license=('LGPL')

ros_makedepends=(ros-hydro-message-filters
  ros-hydro-nav-msgs
  ros-hydro-roscpp
  ros-hydro-catkin
  ros-hydro-std-srvs
  ros-hydro-tf
  ros-hydro-dynamic-reconfigure
  ros-hydro-rostest)
makedepends=('cmake' 'git' 'ros-build-tools'
  ${ros_makedepends[@]})

ros_depends=(ros-hydro-tf
  ros-hydro-roscpp
  ros-hydro-dynamic-reconfigure)
depends=(${ros_depends[@]})

_tag=release/hydro/amcl/${pkgver}-${_pkgver_patch}
_dir=amcl
source=("${_dir}"::"git+https://github.com/ros-gbp/navigation-release.git"#tag=${_tag})
md5sums=('SKIP')

build() {
  # Use ROS environment variables
  source /usr/share/ros-build-tools/clear-ros-env.sh
  [ -f /opt/ros/hydro/setup.bash ] && source /opt/ros/hydro/setup.bash

  # Create build directory
  [ -d ${srcdir}/build ] || mkdir ${srcdir}/build
  cd ${srcdir}/build

  # Fix Python2/Python3 conflicts
  /usr/share/ros-build-tools/fix-python-scripts.sh -v 2 ${srcdir}/${_dir}

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
