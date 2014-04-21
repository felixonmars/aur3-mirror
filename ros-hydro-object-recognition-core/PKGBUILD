# Script generated with import_catkin_packages.py
# For more information: https://github.com/bchretien/arch-ros-stacks
pkgdesc="ROS - object_recognition_core contains tools to launch several recognition pipelines, train objects, store models ."
url='http://wg-perception.github.io/object_recognition_core/'

pkgname='ros-hydro-object-recognition-core'
pkgver='0.6.1'
_pkgver_patch=0
arch=('any')
pkgrel=1
license=('BSD')

ros_makedepends=(ros-hydro-cmake-modules
  ros-hydro-ecto-image-pipeline
  ros-hydro-sensor-msgs
  ros-hydro-ecto
  ros-hydro-catkin)
makedepends=('cmake' 'git' 'ros-build-tools'
  ${ros_makedepends[@]}
  curl
  boost)

ros_depends=(ros-hydro-ecto-image-pipeline
  ros-hydro-sensor-msgs
  ros-hydro-ecto)
depends=(${ros_depends[@]}
  curl
  couchdb
  boost)

_tag=release/hydro/object_recognition_core/${pkgver}-${_pkgver_patch}
_dir=object_recognition_core
source=("${_dir}"::"git+https://github.com/ros-gbp/object_recognition_core-release.git"#tag=${_tag})
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
