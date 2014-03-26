
pkgdesc="ROS - This package is a Ruby client library for ROS, the Robot Operating System."
url='http://www.ros.org/'

pkgname='ros-hydro-rosruby'
pkgver='0.5.5'
_pkgver_patch=0
arch=('i686' 'x86_64')
pkgrel=2
license=('BSD')

ros_makedepends=(ros-hydro-message-generation
  ros-hydro-genmsg
  ros-hydro-rosgraph-msgs
  ros-hydro-catkin
  ros-hydro-rosmsg
  ros-hydro-genrb
  ros-hydro-std-msgs)
makedepends=('cmake' 'git' 'ros-build-tools'
  ${ros_makedepends[@]}
  rake
  ruby)

ros_depends=(ros-hydro-roslang
  ros-hydro-genmsg
  ros-hydro-rosgraph-msgs
  ros-hydro-rosmsg
  ros-hydro-genrb
  ros-hydro-std-msgs)
depends=(${ros_depends[@]})

_tag=release/hydro/rosruby/${pkgver}-${_pkgver_patch}
_dir=rosruby
source=("${_dir}"::"git+https://github.com/OTL/rosruby-release.git"#tag=${_tag}
        "conflicts.patch")
md5sums=('SKIP'
         '8b61ac2732ddfd3d7ba1c5cc6f1c0d93')

build() {
  # Use ROS environment variables
  /usr/share/ros-build-tools/clear-ros-env.sh
  [ -f /opt/ros/hydro/setup.bash ] && source /opt/ros/hydro/setup.bash

  # Apply patch
  msg "Patching source code"
  cd ${srcdir}/${_dir}
  git apply ${srcdir}/conflicts.patch

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
