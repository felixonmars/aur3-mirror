#Maintainer: Benjamin Chretien <chretien at lirmm dot fr>
pkgdesc="ROS - Converts between ROS Image messages and OpenCV images."
url='http://www.ros.org/'
pkgname=ros-groovy-cv-bridge
pkgver=1.10.13
arch=('i686' 'x86_64')
pkgrel=1
license=('BSD')
makedepends=('cmake' 'ros-build-tools')
depends=('boost' 'opencv>=2'
         'ros-groovy-catkin'
         'ros-groovy-rosconsole'
         'ros-groovy-sensor-msgs')

_dir=cv_bridge
_tag=release/groovy/cv_bridge/${pkgver}-0
source=("$_dir"::'git://github.com/ros-gbp/vision_opencv-release.git'#tag=${_tag})
md5sums=('SKIP')

build() {
    [ -f /opt/ros/groovy/setup.bash ] && source /opt/ros/groovy/setup.bash

    [ -d ${srcdir}/build ] || mkdir ${srcdir}/build
    cd ${srcdir}/build

    /usr/share/ros-build-tools/fix-python-scripts.sh ${srcdir}/${_dir}

    cmake ${srcdir}/${_dir} \
        -DCMAKE_BUILD_TYPE=Release \
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
