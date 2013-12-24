#Maintainer: Benjamin Chretien <chretien at lirmm dot fr>
pkgdesc="ROS - Components of MoveIt! connecting to MongoDB."
url='http://www.ros.org/'

pkgname=ros-groovy-moveit-ros-warehouse
pkgver=0.4.6
arch=('i686' 'x86_64')
pkgrel=1
license=('BSD')
makedepends=('ros-build-tools' 'cmake')
depends=('ros-groovy-moveit-ros-planning'
         'ros-groovy-rosconsole'
         'ros-groovy-roscpp'
         'ros-groovy-tf'
         'ros-groovy-warehouse-ros')
_dir=moveit_ros
_subdir=warehouse
source=("$_dir"::'git://github.com/ros-planning/moveit_ros.git'#branch=groovy-devel
        "linker.patch")
md5sums=('SKIP'
         '03d649426bb774059e1be5015cc74a02')

build() {
    [ -f /opt/ros/groovy/setup.bash ] && source /opt/ros/groovy/setup.bash

    # Apply patch
    msg "Patching source code"
    cd ${srcdir}/${_dir}
    git apply ${srcdir}/linker.patch

    [ -d ${srcdir}/build ] || mkdir ${srcdir}/build
    cd ${srcdir}/build

    /usr/share/ros-build-tools/fix-python-scripts.sh ${srcdir}/${_dir}/${_subdir}

    msg "Building package"
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
