pkgdesc="ROS - A very fast C++ library with MATLAB wrappers for computing the 6 DOF motion of a moving mono/stereo camera - ROS Wrapper"
url='http://wiki.ros.org/viso2_ros'
pkgname='ros-indigo-viso2-ros'
pkgver='r107.4159f3e'
_pkgver_patch=0
arch=('any')
pkgrel=1
license=('GPL2')

ros_makedepends=(
  ros-indigo-catkin
  )
makedepends=('cmake' 'git' 'ros-build-tools'
  ${ros_makedepends[@]}
  )

ros_depends=()
depends=(${ros_depends[@]})

_dir=viso2_ros/viso2_ros
source=("${_dir}"::"git+https://github.com/srv/viso2"
        "cmake.patch"
       )
md5sums=('SKIP'
'3adc09319ddada970c1e001a913298ba'
)

build() {
  # Use ROS environment variables
  source /usr/share/ros-build-tools/clear-ros-env.sh
  [ -f /opt/ros/indigo/setup.bash ] && source /opt/ros/indigo/setup.bash

  # Create build directory
  [ -d ${srcdir}/build ] || mkdir ${srcdir}/build
  cd ${srcdir}/build

  # Fix Python2/Python3 conflicts
  /usr/share/ros-build-tools/fix-python-scripts.sh -v 2 ${srcdir}/${_dir}

  sed 's/#include <viso_mono.h>/#include <libviso2\/viso_mono.h>/' -i ${srcdir}/${_dir}/src/*
  sed 's/#include <viso_stereo.h>/#include <libviso2\/viso_stereo.h>/' -i ${srcdir}/${_dir}/src/*
  patch -i ${srcdir}/cmake.patch  ${srcdir}/${_dir}/CMakeLists.txt

  # Build project
  cmake ${srcdir}/${_dir} \
        -DCMAKE_BUILD_TYPE=Release \
        -DCATKIN_BUILD_BINARY_PACKAGE=ON \
        -DCMAKE_INSTALL_PREFIX=/opt/ros/indigo \
        -DPYTHON_EXECUTABLE=/usr/bin/python2 \
        -DPYTHON_INCLUDE_DIR=/usr/include/python2.7 \
        -DPYTHON_LIBRARY=/usr/lib/libpython2.7.so \
        -DPYTHON_BASENAME=-python2.7 \
        -DSETUPTOOLS_DEB_LAYOUT=OFF
  make
}

package() {
  cd "${srcdir}/build"
  make DESTDIR="${pkgdir}/" install
}
