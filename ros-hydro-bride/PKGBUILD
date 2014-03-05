
pkgdesc="ROS - Bride. Installs a full eclipse installation in this package. Additionally CDT and the BRIDE plugins will be installed."
url='http://www.ros.org/'

pkgname='ros-hydro-bride'
pkgver='0.3.0'
_pkgver_patch=4
arch=('i686' 'x86_64')
pkgrel=1
license=('BSD')

ros_makedepends=(ros-hydro-rospack
  ros-hydro-catkin)
makedepends=('cmake' 'git' 'ros-build-tools'
  ${ros_makedepends[@]}
  curl
  jdk7-openjdk)

ros_depends=()
depends=(${ros_depends[@]})

_tag=release/hydro/bride/${pkgver}-${_pkgver_patch}
_dir=bride
source=("${_dir}"::"git+https://github.com/ipa320/bride-release.git"#tag=${_tag}
        "dpkg.patch")
md5sums=('SKIP'
         'dd7cb5fadda2fcb6384ee11a8ac40119')

build() {
  # Use ROS environment variables
  /usr/share/ros-build-tools/clear-ros-env.sh
  [ -f /opt/ros/hydro/setup.bash ] && source /opt/ros/hydro/setup.bash

  # Apply patch
  msg "Patching source code"
  cd ${srcdir}/${_dir}
  git apply ${srcdir}/dpkg.patch

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
