
pkgdesc="ROS - Simple tools and catkin modules for rosjava development."
url='http://www.ros.org/'

pkgname='ros-hydro-rosjava-build-tools'
pkgver='0.1.32'
_pkgver_patch=0
arch=('i686' 'x86_64')
pkgrel=2
license=('BSD')

ros_makedepends=(ros-hydro-rospy
  ros-hydro-catkin)
makedepends=('cmake' 'git' 'ros-build-tools'
  ${ros_makedepends[@]}
  python2-rospkg
  apache-ant
  python2-rosinstall-generator
  jdk7-openjdk)

ros_depends=(ros-hydro-rospy
  ros-hydro-catkin)
depends=(${ros_depends[@]}
  python2-rospkg
  apache-ant
  python2-rosinstall-generator
  jdk7-openjdk)

_tag=release/hydro/rosjava_build_tools/${pkgver}-${_pkgver_patch}
_dir=rosjava_build_tools
source=("${_dir}"::"git+https://github.com/rosjava-release/rosjava_build_tools-release.git"#tag=${_tag})
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
  sed -i 's/python ${SCRIPT}/python2 ${SCRIPT}/g' ${srcdir}/${_dir}/env-hooks/*.em

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
