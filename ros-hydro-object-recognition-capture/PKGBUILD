# Script generated with import_catkin_packages.py
# For more information: https://github.com/bchretien/arch-ros-stacks
pkgdesc="ROS - Capture is a set of tools to capture objects in 3D and perform odometry."
url='http://ecto.willowgarage.com/recognition'

pkgname='ros-hydro-object-recognition-capture'
pkgver='0.2.22'
_pkgver_patch=0
arch=('any')
pkgrel=1
license=('BSD')

ros_makedepends=(ros-hydro-ecto-opencv
  ros-hydro-object-recognition-core
  ros-hydro-ecto-image-pipeline
  ros-hydro-ecto
  ros-hydro-catkin
  ros-hydro-ecto-openni)
makedepends=('cmake' 'git' 'ros-build-tools'
  ${ros_makedepends[@]}
  boost)

ros_depends=(ros-hydro-ecto-opencv
  ros-hydro-object-recognition-core
  ros-hydro-ecto-ros
  ros-hydro-ecto-image-pipeline
  ros-hydro-ecto
  ros-hydro-ecto-openni)
depends=(${ros_depends[@]}
  boost)

_tag=release/hydro/object_recognition_capture/${pkgver}-${_pkgver_patch}
_dir=object_recognition_capture
source=("${_dir}"::"git+https://github.com/ros-gbp/object_recognition_capture-release.git"#tag=${_tag})
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
