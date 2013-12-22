#Maintainer: Benjamin Chretien <chretien at lirmm dot fr>
pkgdesc="ROS - A common package for CMake Modules which are not distributed with CMake but are commonly used by ROS packages."
url='http://www.ros.org/'

_name=cmake_modules
pkgname=ros-groovy-cmake-modules
pkgver=0.2.0
arch=('i686' 'x86_64')
pkgrel=1
license=('BSD')
makedepends=('cmake' 'ros-build-tools')
depends=('cmake')
_dir=${_name}
source=("$_dir"::"git://github.com/ros/${_name}.git"#tag=${pkgver})
md5sums=('SKIP')

build() {
    [ -f /opt/ros/groovy/setup.bash ] && source /opt/ros/groovy/setup.bash
    [ -d ${srcdir}/build ] || mkdir ${srcdir}/build
    cd ${srcdir}/build
    /usr/share/ros-build-tools/fix-python-scripts.sh ${srcdir}/${_dir}
    cmake ${srcdir}/${_dir} \
        -DCATKIN_BUILD_BINARY_PACKAGE=ON \
        -DCMAKE_INSTALL_PREFIX=/opt/ros/groovy \
        -DSETUPTOOLS_DEB_LAYOUT=OFF
    make
}

package() {
    cd "${srcdir}/build"
    make DESTDIR="${pkgdir}/" install
}
