#Maintainer: Benjamin Chretien <chretien at lirmm dot fr>
pkgdesc="ROS - Generates a configuration package that makes it easy to use MoveIt!"
url='http://www.ros.org/'

pkgname=ros-groovy-moveit-setup-assistant
pkgver=0.4.2
arch=('i686' 'x86_64')
pkgrel=1
license=('BSD')
makedepends=('ros-build-tools' 'cmake')
depends=('yaml-cpp' 'qt4' 'ogre-1.8'
         'ros-groovy-moveit-core'
         'ros-groovy-moveit-ros-planning'
         'ros-groovy-moveit-ros-visualization')
_dir=moveit_setup_assistant
source=("$_dir"::'git://github.com/bchretien/moveit_setup_assistant.git'#branch=groovy-devel)
md5sums=('SKIP')


build() {
    [ -f /opt/ros/groovy/setup.bash ] && source /opt/ros/groovy/setup.bash

    [ -d ${srcdir}/build ] || mkdir ${srcdir}/build
    cd ${srcdir}/build

    /usr/share/ros-build-tools/fix-python-scripts.sh ${srcdir}/${_dir}

    # Adapt paths for Ogre 1.8
    export PKG_CONFIG_PATH="/opt/OGRE-1.8/lib/pkgconfig:$PKG_CONFIG_PATH"

    cmake ${srcdir}/${_dir} \
        -DCATKIN_BUILD_BINARY_PACKAGE=ON \
        -DCMAKE_INSTALL_PREFIX=/opt/ros/groovy \
        -DPYTHON_EXECUTABLE=/usr/bin/python2 \
        -DPYTHON_INCLUDE_DIR=/usr/include/python2.7 \
        -DPYTHON_LIBRARY=/usr/lib/libpython2.7.so \
        -DCMAKE_LIBRARY_PATH="/opt/OGRE-1.8/lib" \
        -DSETUPTOOLS_DEB_LAYOUT=OFF
    make
}

package() {
    cd "${srcdir}/build"
    make DESTDIR="${pkgdir}/" install
}
