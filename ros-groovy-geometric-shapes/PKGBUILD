
pkgdesc="ROS - Contains generic definitions of geometric shapes and bodies."
url='http://www.ros.org/'

pkgname='ros-groovy-geometric-shapes'
pkgver='0.3.4'
arch=('i686' 'x86_64')
pkgrel=1
license=('BSD')
makedepends=('ros-build-tools')

ros_depends=(ros-groovy-random-numbers
  ros-groovy-catkin
  ros-groovy-resource-retriever
  ros-groovy-shape-tools
  ros-groovy-eigen-stl-containers
  ros-groovy-octomap
  ros-groovy-console-bridge
  ros-groovy-shape-msgs)
depends=(${ros_depends[@]}
  assimp
  qhull
  boost
  eigen3)

source=()
md5sums=('SKIP')

build() {
  [ -f /opt/ros/groovy/setup.bash ] && source /opt/ros/groovy/setup.bash

  if [ -d ${srcdir}/geometric_shapes ]; then
    cd ${srcdir}/geometric_shapes
    git fetch origin --tags
    git reset --hard release/groovy/geometric_shapes/${pkgver}-0
  else
    git clone -b release/groovy/geometric_shapes/${pkgver}-0 git://github.com/ros-gbp/geometric_shapes-release.git ${srcdir}/geometric_shapes
  fi

  #cd ${srcdir}/geometric_shapes && patch -p1 < ${srcdir}/geometric_shapes.patch
  [ -d ${srcdir}/build ] || mkdir ${srcdir}/build
  cd ${srcdir}/build

  /usr/share/ros-build-tools/fix-python-scripts.sh ${srcdir}/geometric_shapes

  cmake ${srcdir}/geometric_shapes -DCATKIN_BUILD_BINARY_PACKAGE=ON \
                                   -DCMAKE_INSTALL_PREFIX=/opt/ros/groovy \
                                   -DSETUPTOOLS_DEB_LAYOUT=OFF
  make
}

package() {
  cd "${srcdir}/build"
  make DESTDIR="${pkgdir}/" install
}
