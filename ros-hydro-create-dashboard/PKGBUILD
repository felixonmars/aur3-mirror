
pkgdesc="ROS - The Create dashboard is a RQT-based plug-in for visualising data from the Create and giving easy access to basic functionalities."
url='http://www.ros.org/'

pkgname='ros-hydro-create-dashboard'
pkgver='2.2.0'
_pkgver_patch=0
arch=('i686' 'x86_64')
pkgrel=1
license=('BSD')

ros_makedepends=(ros-hydro-rqt-gui-py
  ros-hydro-create-node
  ros-hydro-rospy
  ros-hydro-rqt-gui
  ros-hydro-catkin
  ros-hydro-rqt-robot-dashboard
  ros-hydro-diagnostic-msgs)
makedepends=('cmake' 'git' 'ros-build-tools'
  ${ros_makedepends[@]})

ros_depends=(ros-hydro-rqt-gui-py
  ros-hydro-create-node
  ros-hydro-rospy
  ros-hydro-rqt-gui
  ros-hydro-rqt-robot-dashboard
  ros-hydro-diagnostic-msgs)
depends=(${ros_depends[@]})

_tag=release/hydro/create_dashboard/${pkgver}-${_pkgver_patch}
_dir=create_dashboard
source=("${_dir}"::"git+https://github.com/turtlebot-release/turtlebot_create_desktop-release.git"#tag=${_tag})
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
