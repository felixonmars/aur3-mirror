#Maintainer: Benjamin Chretien <chretien at lirmm dot fr>
pkgdesc="ROS - A generic driver for USB camera that are supported by V4L."
url='http://www.ros.org/'
pkgname=ros-groovy-usb-cam
pkgver=0.1.3
arch=('i686' 'x86_64')
pkgrel=2
license=('BSD')
makedepends=('cmake' 'ros-build-tools')
depends=('ffmpeg'
         'ros-groovy-camera-info-manager'
         'ros-groovy-image-transport'
         'ros-groovy-roscpp'
         'ros-groovy-self-test'
         'ros-groovy-sensor-msgs'
         'ros-groovy-std-msgs')
_dir=usb_cam
source=("$_dir"::'git://github.com/bosch-ros-pkg/usb_cam.git'#branch=groovy-devel)
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
