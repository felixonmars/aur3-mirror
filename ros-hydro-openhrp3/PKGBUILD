# Script generated with import_catkin_packages.py
# For more information: https://github.com/bchretien/arch-ros-stacks
pkgdesc="ROS - This package does not only wrap OpenHRP3 but actually provides the built artifact from the code from its mainstream repository."
url='https://openrtp.jp/svn/hrg/openhrp/'

pkgname='ros-hydro-openhrp3'
pkgver='3.1.5'
_pkgver_patch=6
arch=('any')
pkgrel=1
license=('EPL')

ros_makedepends=(ros-hydro-roslang
  ros-hydro-rosbuild
  ros-hydro-openrtm-aist-python
  ros-hydro-catkin
  ros-hydro-mk
  ros-hydro-openrtm-aist
  ros-hydro-rostest)
makedepends=('cmake' 'git' 'ros-build-tools'
  ${ros_makedepends[@]}
  f2c
  doxygen
  libjpeg-turbo
  collada-dom
  subversion
  boost
  eigen3
  libpng
  atlas-lapack)

ros_depends=(ros-hydro-openrtm-aist
  ros-hydro-openrtm-aist-python)
depends=(${ros_depends[@]}
  f2c
  atlas-lapack
  libjpeg-turbo
  collada-dom
  eigen3
  libpng
  boost)

_tag=release/hydro/openhrp3/${pkgver}-${_pkgver_patch}
_dir=openhrp3
source=("${_dir}"::"git+https://github.com/tork-a/openhrp3-release.git"#tag=${_tag})
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
