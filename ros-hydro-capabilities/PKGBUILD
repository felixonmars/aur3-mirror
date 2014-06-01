# Script generated with import_catkin_packages.py
# For more information: https://github.com/bchretien/arch-ros-stacks
pkgdesc="ROS - Package which implements capabilities, including code to parse capability interface specs, to parse capability provider specs, and implement the capability server."
url='http://wiki.ros.org/capabilities'

pkgname='ros-hydro-capabilities'
pkgver='0.1.1'
_pkgver_patch=0
arch=('any')
pkgrel=1
license=('BSD')

ros_makedepends=(ros-hydro-message-generation
  ros-hydro-rospy
  ros-hydro-catkin
  ros-hydro-std-srvs
  ros-hydro-roslaunch
  ros-hydro-std-msgs
  ros-hydro-rostest)
makedepends=('cmake' 'git' 'ros-build-tools'
  ${ros_makedepends[@]})

ros_depends=(ros-hydro-rospy
  ros-hydro-message-runtime
  ros-hydro-bondpy
  ros-hydro-nodelet
  ros-hydro-std-srvs
  ros-hydro-roslaunch
  ros-hydro-std-msgs)
depends=(${ros_depends[@]}
  python2-yaml)

_tag=release/hydro/capabilities/${pkgver}-${_pkgver_patch}
_dir=capabilities
source=("${_dir}"::"git+https://github.com/ros-gbp/capabilities-release.git"#tag=${_tag})
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
