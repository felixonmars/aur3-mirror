
pkgdesc="ROS - Lisp client library for ROS, the Robot Operating System."
url='http://www.ros.org/'

pkgname='ros-groovy-roslisp'
pkgver='1.9.15'
_pkgver_patch=0
arch=('i686' 'x86_64')
pkgrel=1
license=('BSD')
makedepends=('cmake' 'ros-build-tools')

ros_depends=(ros-groovy-rospack
  ros-groovy-roslang
  ros-groovy-std-srvs
  ros-groovy-rosgraph-msgs)
depends=(${ros_depends[@]}
  sbcl)

_tag=release/groovy/roslisp/${pkgver}-${_pkgver_patch}
_dir=roslisp
source=("${_dir}"::"git+https://github.com/ros-gbp/roslisp-release.git"#tag=${_tag})
md5sums=('SKIP')

build() {
  # Use ROS environment variables
  /usr/share/ros-build-tools/clear-ros-env.sh
  [ -f /opt/ros/groovy/setup.bash ] && source /opt/ros/groovy/setup.bash

  # Create build directory
  [ -d ${srcdir}/build ] || mkdir ${srcdir}/build
  cd ${srcdir}/build

  # Fix Python2/Python3 conflicts
  /usr/share/ros-build-tools/fix-python-scripts.sh ${srcdir}/${_dir}

  # Build project
  cmake ${srcdir}/${_dir} \
        -DCMAKE_BUILD_TYPE=Release \
        -DCATKIN_BUILD_BINARY_PACKAGE=ON \
        -DCMAKE_INSTALL_PREFIX=/opt/ros/groovy \
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