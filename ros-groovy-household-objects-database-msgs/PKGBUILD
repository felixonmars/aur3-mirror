#Maintainer: Benjamin Chretien <chretien at lirmm dot fr>
pkgdesc="ROS - The household_objects_database_msgs package"
url='http://www.ros.org/'
pkgname=ros-groovy-household-objects-database-msgs
pkgver=0.1.1
arch=('i686' 'x86_64')
pkgrel=1
license=('BSD')
makedepends=('cmake' 'ros-build-tools' )
depends=('ros-groovy-geometry-msgs'
         'ros-groovy-message-generation'
         'ros-groovy-message-runtime'
         'ros-groovy-object-recognition-msgs'
         'ros-groovy-shape-msgs'
         'ros-groovy-std-msgs')
_dir=household_objects_database_msgs
source=("$_dir"::'git://github.com/ros-interactive-manipulation/household_objects_database_msgs.git'#tag=${pkgver})
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
