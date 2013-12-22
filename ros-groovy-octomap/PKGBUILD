#Maintainer: Benjamin Chretien <chretien at lirmm dot fr>
pkgdesc="ROS - ROS package for the OctoMap library."
url='http://www.ros.org/'
pkgname=ros-groovy-octomap
pkgver=0.3.0
arch=('i686' 'x86_64')
pkgrel=1
license=('BSD')
makedepends=('cmake' 'ros-build-tools')
depends=('octomap'
         'pcl-ros'
         'ros-groovy-octomap-msgs'
         'ros-groovy-sensor-msgs'
         'ros-groovy-tf')
_dir=octomap
source=("$_dir"::'git://github.com/OctoMap/octomap_ros.git'#tag=${pkgver})
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
