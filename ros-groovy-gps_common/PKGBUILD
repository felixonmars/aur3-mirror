pkgname=ros-groovy-gps_common
pkgver=0.1.6
pkgrel=1
pkgdesc="the gps_common module containing the two gps message types"
url="https://github.com/ktossell/gps_umd"
arch=('i686' 'x86_64')
license=('BSD')
depends=('ros-groovy-message-runtime')
makedepends=('cmake' 'ros-build-tools')
md5sums=('SKIP')
conflicts=()
replaces=()
backup=()

_name=gps_umd
_dir=${_name}
source=("$_dir"::"git://github.com/ktossell/${_name}.git"#tag=gps_umd-${pkgver})

# Subdirectory that will be installed
_subdir="gps_common"

build() {
    mkdir -p "${srcdir}/build/${_subdir}"
    cd "${srcdir}/build/${_subdir}"

    /usr/share/ros-build-tools/fix-python-scripts.sh "${srcdir}/build/${_subdir}"

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
    cd "${srcdir}/build/${_subdir}"
    make DESTDIR="${pkgdir}/" install
}
