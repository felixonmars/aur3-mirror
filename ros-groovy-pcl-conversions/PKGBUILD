#Maintainer: Benjamin Chretien <chretien at lirmm dot fr>
pkgdesc="ROS - Provides conversions from PCL data types and ROS message types."
url='http://www.ros.org/'
pkgname=ros-groovy-pcl-conversions
pkgver=0.1.5
arch=('i686' 'x86_64')
pkgrel=1
license=('BSD')
makedepends=('cmake' 'ros-build-tools')
depends=('pcl-ros'
         'ros-groovy-catkin'
         'ros-groovy-pcl-msgs'
         'ros-groovy-roscpp'
         'ros-groovy-sensor-msgs'
         'ros-groovy-std-msgs')
optdepends=()

_dir="pcl_conversions"
source=("$_dir"::'git://github.com/ros-perception/pcl_conversions.git'#tag=${pkgver})
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
