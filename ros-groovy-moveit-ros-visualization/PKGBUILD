#Maintainer: Benjamin Chretien <chretien at lirmm dot fr>
pkgdesc="ROS - Components of MoveIt! that offer visualization."
url='http://www.ros.org/'

pkgname=ros-groovy-moveit-ros-visualization
pkgver=0.4.6
arch=('i686' 'x86_64')
pkgrel=1
license=('BSD')
makedepends=('ros-build-tools' 'cmake')
depends=('ogre-1.8'
         'ros-groovy-geometric-shapes'
         'ros-groovy-interactive-markers'
         'ros-groovy-moveit-ros-planning-interface'
         'ros-groovy-moveit-ros-warehouse'
         'ros-groovy-moveit-ros-robot-interaction'
         'ros-groovy-pluginlib'
         'ros-groovy-roscpp'
         'ros-groovy-rviz')
_dir=moveit_ros
_subdir=visualization
source=("$_dir"::'git://github.com/ros-planning/moveit_ros.git'#branch=groovy-devel)
md5sums=('SKIP')


build() {
    [ -f /opt/ros/groovy/setup.bash ] && source /opt/ros/groovy/setup.bash

    [ -d ${srcdir}/build ] || mkdir ${srcdir}/build
    cd ${srcdir}/build

    /usr/share/ros-build-tools/fix-python-scripts.sh ${srcdir}/${_dir}/${_subdir}

    # Adapt paths for Ogre 1.8
    export PKG_CONFIG_PATH="/opt/OGRE-1.8/lib/pkgconfig:$PKG_CONFIG_PATH"

    cmake ${srcdir}/${_dir}/${_subdir} \
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
