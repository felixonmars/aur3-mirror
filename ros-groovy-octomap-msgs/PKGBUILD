#Maintainer: Benjamin Chretien <chretien at lirmm dot fr>
pkgdesc="ROS - ROS package to provide messages and serializations / conversion for the OctoMap library."
url='http://www.ros.org/'
pkgname=ros-groovy-octomap-msgs
pkgver=0.2.9
arch=('i686' 'x86_64')
pkgrel=1
license=('BSD')
makedepends=('cmake' 'ros-build-tools' 'ros-groovy-message-generation')
depends=('ros-groovy-geometry-msgs'
         'ros-groovy-message-runtime'
         'ros-groovy-std-msgs')
_dir=octomap_msgs
source=("$_dir"::'git://github.com/OctoMap/octomap_msgs.git'#tag=${pkgver})
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
