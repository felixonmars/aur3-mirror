# Script generated with import_catkin_packages.py
# For more information: https://github.com/bchretien/arch-ros-stacks
pkgdesc="ROS - Provides an easy to use and general interface between a SQL database and object-oriented C++ code, making it easy to encapsulate the conceptual objects contained in the database as C++ classes."
url='http://ros.org/wiki/database_interface'

pkgname='ros-hydro-sql-database'
pkgver='0.4.8'
_pkgver_patch=0
arch=('any')
pkgrel=1
license=('BSD')

ros_makedepends=(ros-hydro-roscpp
  ros-hydro-catkin)
makedepends=('cmake' 'git' 'ros-build-tools'
  ${ros_makedepends[@]}
  postgresql-libs
  yaml-cpp)

ros_depends=(ros-hydro-roscpp)
depends=(${ros_depends[@]}
  postgresql-libs
  yaml-cpp)

_tag=release/hydro/sql_database/${pkgver}-${_pkgver_patch}
_dir=sql_database
source=("${_dir}"::"git+https://github.com/ros-gbp/sql_database-release.git"#tag=${_tag})
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
