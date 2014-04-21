# Script generated with import_catkin_packages.py
# For more information: https://github.com/bchretien/arch-ros-stacks
pkgdesc="ROS - basic 3d reconstruction of an object from aligned Kinect data."
url='http://wg-perception.github.io/reconstruction/'

pkgname='ros-hydro-object-recognition-reconstruction'
pkgver='0.3.0'
_pkgver_patch=0
arch=('any')
pkgrel=1
license=('BSD')

ros_makedepends=(ros-hydro-object-recognition-core
  ros-hydro-sensor-msgs
  ros-hydro-opencv-candidate
  ros-hydro-ecto-image-pipeline
  ros-hydro-ecto
  ros-hydro-opencv2
  ros-hydro-ecto-pcl
  ros-hydro-catkin)
makedepends=('cmake' 'git' 'ros-build-tools'
  ${ros_makedepends[@]})

ros_depends=(ros-hydro-object-recognition-core
  ros-hydro-opencv-candidate
  ros-hydro-ecto-image-pipeline
  ros-hydro-ecto
  ros-hydro-opencv2
  ros-hydro-ecto-pcl)
depends=(${ros_depends[@]}
  meshlab)

_tag=release/hydro/object_recognition_reconstruction/${pkgver}-${_pkgver_patch}
_dir=object_recognition_reconstruction
source=("${_dir}"::"git+https://github.com/ros-gbp/object_recognition_reconstruction-release.git"#tag=${_tag})
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
