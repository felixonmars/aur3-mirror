# Script generated with import_catkin_packages.py
# For more information: https://github.com/bchretien/arch-ros-stacks
pkgdesc="ROS - A technique to recognize and estimate poses of transparent objects."
url='http://wg-perception.github.io/transparent_objects'

pkgname='ros-hydro-object-recognition-transparent-objects'
pkgver='0.3.18'
_pkgver_patch=0
arch=('any')
pkgrel=1
license=('BSD')

ros_makedepends=(ros-hydro-ecto
  ros-hydro-catkin
  ros-hydro-pcl-ros
  ros-hydro-object-recognition-core)
makedepends=('cmake' 'git' 'ros-build-tools'
  ${ros_makedepends[@]}
  openni)

ros_depends=(ros-hydro-ecto
  ros-hydro-ecto-opencv
  ros-hydro-pcl-ros
  ros-hydro-object-recognition-core)
depends=(${ros_depends[@]}
  openni)

_tag=release/hydro/object_recognition_transparent_objects/${pkgver}-${_pkgver_patch}
_dir=object_recognition_transparent_objects
source=("${_dir}"::"git+https://github.com/ros-gbp/object_recognition_transparent_objects-release.git"#tag=${_tag})
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
