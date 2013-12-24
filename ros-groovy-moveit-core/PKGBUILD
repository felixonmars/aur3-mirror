#Maintainer: Benjamin Chretien <chretien at lirmm dot fr>
pkgdesc="ROS - MoveIt! Core Libraries."
url='http://www.ros.org/'

pkgname=ros-groovy-moveit-core
pkgver=0.5.5
arch=('i686' 'x86_64')
pkgrel=1
license=('BSD')
makedepends=('ros-build-tools' 'cmake')
depends=('eigen3' 'boost' 'assimp'
         'ros-groovy-actionlib-msgs'
         'ros-groovy-console-bridge'
         'ros-groovy-eigen-conversions'
         'ros-groovy-eigen-stl-containers'
         'ros-groovy-fcl'
         'ros-groovy-geometry-msgs'
         'ros-groovy-geometric-shapes>=0.3.4'
         'ros-groovy-kdl-parser'
         'ros-groovy-octomap'
         'ros-groovy-octomap-msgs'
         'ros-groovy-random-numbers'
         'ros-groovy-rostime'
         'ros-groovy-sensor-msgs'
         'ros-groovy-shape-msgs'
         'ros-groovy-std-msgs'
         'ros-groovy-shape-tools'
         'ros-groovy-srdfdom'
         'ros-groovy-trajectory-msgs'
         'ros-groovy-urdfdom'
         'ros-groovy-urdfdom-headers'
         'ros-groovy-visualization-msgs')
_dir=moveit
source=("$_dir"::'git://github.com/ros-planning/moveit_core.git'#branch=groovy-devel)
md5sums=('SKIP')


build() {
    [ -f /opt/ros/groovy/setup.bash ] && source /opt/ros/groovy/setup.bash
    [ -d ${srcdir}/build ] || mkdir ${srcdir}/build
    cd ${srcdir}/build
    /usr/share/ros-build-tools/fix-python-scripts.sh ${srcdir}/${_dir}
    cmake ${srcdir}/${_dir} \
        -DCATKIN_BUILD_BINARY_PACKAGE=ON \
        -DCMAKE_INSTALL_PREFIX=/opt/ros/groovy \
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
