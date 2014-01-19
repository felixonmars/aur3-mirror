
pkgdesc="ROS - The smach_ros package contains extensions for the SMACH library to integrate it tightly with ROS."
url='http://www.ros.org/'

pkgname='ros-hydro-smach-ros'
pkgver='1.3.1'
_pkgver_patch=0
arch=('i686' 'x86_64')
pkgrel=1
license=('BSD')
makedepends=('cmake' 'git' 'ros-build-tools')

ros_depends=(ros-hydro-smach
  ros-hydro-actionlib
  ros-hydro-rospy
  ros-hydro-rostopic
  ros-hydro-std-srvs
  ros-hydro-actionlib-msgs
  ros-hydro-std-msgs
  ros-hydro-smach-msgs)
depends=(${ros_depends[@]})

_tag=release/hydro/smach_ros/${pkgver}-${_pkgver_patch}
_dir=smach_ros
source=("${_dir}"::"git+https://github.com/ros-gbp/executive_smach-release.git"#tag=${_tag})
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
