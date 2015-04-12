pkgdesc="ROS -  A very fast C++ library with MATLAB wrappers for computing the 6 DOF motion of a moving mono/stereo camera"
url='http://www.cvlibs.net/software/libviso/'

pkgname='ros-indigo-libviso2'
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

_dir=libviso2/libviso2
source=("${_dir}"::"git+https://github.com/srv/viso2"
        "cmake.patch")
md5sums=('SKIP'
        'fa4dfc4a282290b9979785546477dcda')

build() {
  # Use ROS environment variables
  source /usr/share/ros-build-tools/clear-ros-env.sh
  [ -f /opt/ros/indigo/setup.bash ] && source /opt/ros/indigo/setup.bash

  # Create build directory
  [ -d ${srcdir}/build ] || mkdir ${srcdir}/build
  cd ${srcdir}/build

  # Fix Python2/Python3 conflicts
  /usr/share/ros-build-tools/fix-python-scripts.sh -v 2 ${srcdir}/${_dir}

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
