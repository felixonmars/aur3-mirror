
pkgdesc="ROS - RViz plugins for the Oculus Rift."
url='http://www.ros.org/'

pkgname='ros-hydro-oculus-rviz-plugins'
pkgver='0.0.8'
_pkgver_patch=0
arch=('i686' 'x86_64')
pkgrel=2
license=('BSD')

ros_makedepends=(ros-hydro-tf
  ros-hydro-roscpp
  ros-hydro-catkin
  ros-hydro-oculus-sdk
  ros-hydro-rviz)
makedepends=('cmake' 'git' 'ros-build-tools'
  ${ros_makedepends[@]}
  qt4
  boost
  ogre)

ros_depends=(ros-hydro-tf
  ros-hydro-roscpp
  ros-hydro-oculus-sdk
  ros-hydro-rviz)
depends=(${ros_depends[@]}
  qt4
  boost
  ogre)

_tag=release/hydro/oculus_rviz_plugins/${pkgver}-${_pkgver_patch}
_dir=oculus_rviz_plugins
source=("${_dir}"::"git+https://github.com/ros-gbp/oculus_rviz_plugins-release.git"#tag=${_tag}
        'ogre.patch')
md5sums=('SKIP'
         '8992007e6799faa51762b108128855e5')

build() {
  # Use ROS environment variables
  /usr/share/ros-build-tools/clear-ros-env.sh
  [ -f /opt/ros/hydro/setup.bash ] && source /opt/ros/hydro/setup.bash

  # Apply patch
  msg "Patching source code"
  cd ${srcdir}/${_dir}
  git apply ${srcdir}/ogre.patch

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
