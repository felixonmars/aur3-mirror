
pkgdesc="ROS - An OpenRTM-aist-based robot controller."
url='http://www.ros.org/'

pkgname='ros-hydro-hrpsys'
pkgver='315.1.8'
_pkgver_patch=1
arch=('i686' 'x86_64')
pkgrel=2
license=('EPL')

ros_makedepends=(ros-hydro-catkin
  ros-hydro-mk
  ros-hydro-opencv2
  ros-hydro-openhrp3
  ros-hydro-rostest)
makedepends=('cmake' 'git' 'ros-build-tools'
  ${ros_makedepends[@]}
  python2
  tk
  doxygen
  libxml2
  irrlicht
  libxmu
  subversion
  qhull
  sdl
  glew
  freeglut)

ros_depends=(ros-hydro-opencv2
  ros-hydro-openhrp3)
depends=(${ros_depends[@]}
  libxmu
  libxml2
  irrlicht
  qhull
  sdl
  freeglut)

_tag=release/hydro/hrpsys/${pkgver}-${_pkgver_patch}
_dir=hrpsys
source=("${_dir}"::"git+https://github.com/tork-a/hrpsys-release.git"#tag=${_tag}
        "qhull.patch"
        "boost.patch"
        "python.patch")
md5sums=('SKIP'
         '3ba967f737015d2d2324a64547a5244f'
         'c76ca707b2ce194cf8a87a3e70e198ad'
         'db51497ef6990d780fe833c1f363cceb')

build() {
  # Use ROS environment variables
  /usr/share/ros-build-tools/clear-ros-env.sh
  [ -f /opt/ros/hydro/setup.bash ] && source /opt/ros/hydro/setup.bash

  # Apply patch
  msg "Patching source code"
  cd ${srcdir}/${_dir}
  git apply ${srcdir}/qhull.patch
  git apply ${srcdir}/boost.patch
  git apply ${srcdir}/python.patch

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
