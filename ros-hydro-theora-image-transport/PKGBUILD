
pkgdesc="ROS - Theora_image_transport provides a plugin to image_transport for transparently sending an image stream encoded with the Theora codec."
url='http://www.ros.org/'

pkgname='ros-hydro-theora-image-transport'
pkgver='1.8.21'
_pkgver_patch=0
arch=('i686' 'x86_64')
pkgrel=1
license=('BSD')
makedepends=('cmake' 'git' 'ros-build-tools')

ros_depends=(ros-hydro-message-generation
  ros-hydro-cv-bridge
  ros-hydro-message-runtime
  ros-hydro-rosbag
  ros-hydro-image-transport
  ros-hydro-tf
  ros-hydro-dynamic-reconfigure
  ros-hydro-pluginlib)
depends=(${ros_depends[@]}
  libogg
  libtheora)

_tag=release/hydro/theora_image_transport/${pkgver}-${_pkgver_patch}
_dir=theora_image_transport
source=("${_dir}"::"git+https://github.com/ros-gbp/image_transport_plugins-release.git"#tag=${_tag})
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
