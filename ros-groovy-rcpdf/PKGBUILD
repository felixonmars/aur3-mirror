#Maintainer: Benjamin Chretien <chretien at lirmm dot fr>
pkgdesc="ROS - Robot Contact Point Description Format interfaces parser."
url='http://www.ros.org/'

_name=rcpdf
pkgname=ros-groovy-rcpdf
pkgver=0.2
arch=('i686' 'x86_64')
pkgrel=1
license=('BSD')
makedepends=('ros-build-tools')
depends=('boost'
         'ros-groovy-roscpp>=1.9'
         'ros-groovy-urdf>=1.9'
         'ros-groovy-urdfdom>=0.2'
         'ros-groovy-urdfdom-headers>=0.2'
         'ros-groovy-rcpdf-interface>=0.2'
         'tinyxml>=2.6')
_dir=robot_contact_point
source=("$_dir"::"git://github.com/laas/robot_contact_point.git"#branch=groovy)
md5sums=('SKIP')

build() {
    # Update submodules
    cd ${srcdir}/${_dir}
    git submodule init && git submodule update

    [ -f /opt/ros/groovy/setup.bash ] && source /opt/ros/groovy/setup.bash
    [ -d ${srcdir}/build ] || mkdir ${srcdir}/build
    /usr/share/ros-build-tools/fix-python-scripts.sh ${srcdir}/${_dir}/${_name}

    # Build
    cd ${srcdir}/build
    cmake ${srcdir}/${_dir}/${_name} \
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
