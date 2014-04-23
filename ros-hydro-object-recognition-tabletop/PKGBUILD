# Script generated with import_catkin_packages.py
# For more information: https://github.com/bchretien/arch-ros-stacks
pkgdesc="ROS - A port of the old tabletop object recognition."
url='http://ecto.willowgarage.com'

pkgname='ros-hydro-object-recognition-tabletop'
pkgver='0.3.1'
_pkgver_patch=0
arch=('any')
pkgrel=1
license=('BSD')

ros_makedepends=(ros-hydro-object-recognition-msgs
  ros-hydro-object-recognition-core
  ros-hydro-opencv-candidate
  ros-hydro-tf
  ros-hydro-ecto
  ros-hydro-catkin
  ros-hydro-moveit-core
  ros-hydro-household-objects-database
  ros-hydro-sql-database
  ros-hydro-pluginlib)
makedepends=('cmake' 'git' 'ros-build-tools'
  ${ros_makedepends[@]}
  assimp)

ros_depends=(ros-hydro-object-recognition-msgs
  ros-hydro-object-recognition-core
  ros-hydro-opencv-candidate
  ros-hydro-tf
  ros-hydro-ecto
  ros-hydro-moveit-core
  ros-hydro-household-objects-database
  ros-hydro-sql-database
  ros-hydro-pluginlib)
depends=(${ros_depends[@]}
  assimp)

_tag=release/hydro/object_recognition_tabletop/${pkgver}-${_pkgver_patch}
_dir=object_recognition_tabletop
source=("${_dir}"::"git+https://github.com/ros-gbp/object_recognition_tabletop-release.git"#tag=${_tag})
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
