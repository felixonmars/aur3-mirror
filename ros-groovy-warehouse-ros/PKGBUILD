#Maintainer: Benjamin Chretien <chretien at lirmm dot fr>
pkgdesc="ROS - Persistent storage of ROS data using MongoDB."
url='http://www.ros.org/'

pkgname=ros-groovy-warehouse-ros
pkgver=0.8.4
arch=('i686' 'x86_64')
pkgrel=1
license=('BSD')
makedepends=('ros-build-tools' 'cmake')
depends=('curl' 'mongodb'
         'ros-groovy-geometry-msgs'
         'ros-groovy-roscpp'
         'ros-groovy-rospy'
         'ros-groovy-rostime'
         'ros-groovy-rostest'
         'ros-groovy-std-msgs')
_dir=warehouse_ros
source=("$_dir"::'git://github.com/ros-planning/warehouse_ros.git'#tag=${pkgver})
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
