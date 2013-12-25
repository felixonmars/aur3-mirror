#Maintainer: Benjamin Chretien <chretien at lirmm dot fr>
pkgdesc="ROS - Description (mechanical, kinematic, visual, etc.) of the PR2 robot."
url='http://www.ros.org/'

_name=pr2_description
pkgname=ros-groovy-pr2-description
pkgver=1.11.3
arch=('i686' 'x86_64')
pkgrel=2
license=('BSD')
makedepends=('ros-build-tools')
depends=('ros-groovy-convex-decomposition'
         'ros-groovy-ivcon'
         'ros-groovy-xacro')
_dir=pr2_common
_subdir=${_name}
source=("$_dir"::"git://github.com/PR2/pr2_common.git"#tag=${pkgver})
md5sums=('SKIP')

build() {
    [ -f /opt/ros/groovy/setup.bash ] && source /opt/ros/groovy/setup.bash
    [ -d ${srcdir}/build ] || mkdir ${srcdir}/build
    cd ${srcdir}/build
    /usr/share/ros-build-tools/fix-python-scripts.sh ${srcdir}/${_dir}/${_subdir}
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
