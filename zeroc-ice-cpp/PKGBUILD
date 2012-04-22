# Maintainer: schuay <jakob.gruber@gmail.com>

pkgname='zeroc-ice-cpp'
pkgver='3.4.2'
pkgrel=2
pkgdesc='An object-oriented middleware that provides object-oriented Remote Procedure Call functionality. C++ only.'
arch=('i686' 'x86_64')
url='http://www.zeroc.com'
license=('GPL' 'custom: ICE license')
depends=('db' 'openssl' 'expat' 'mcpp')
checkdepends=('python2')

source=(
    "http://www.zeroc.com/download/Ice/3.4/Ice-$pkgver.tar.gz" 
    "http://www.elpauer.org/stuff/FindZeroCIce.cmake"
    "http://www.elpauer.org/stuff/FindZeroCIceBox.cmake"
    "http://www.elpauer.org/stuff/FindZeroCIceCore.cmake"
    "http://www.elpauer.org/stuff/FindZeroCIceExecutables.cmake"
    "http://www.elpauer.org/stuff/FindZeroCIceGrid.cmake"
    "http://www.elpauer.org/stuff/FindZeroCIcePatch2.cmake"
    "http://www.elpauer.org/stuff/FindZeroCIceSSL.cmake"
    "http://www.elpauer.org/stuff/FindZeroCIceStorm.cmake"
    "http://www.elpauer.org/stuff/FindZeroCIceUtil.cmake"
    "http://www.elpauer.org/stuff/FindZeroCIceXML.cmake"
    "bdb5.patch"
    "gcc46.patch"
    "ice-3.4.2-gcc47.patch"
    "Ice-3.4.2_2.patch"
    "freebsd_patches.tar.gz"
    )

build() {
    cd ${srcdir}/Ice-$pkgver/cpp

    patch src/Freeze/MapI.cpp < "${srcdir}/bdb5.patch"
    patch include/Ice/Config.h < "${srcdir}/gcc46.patch"
    patch -Np2 < ${srcdir}/ice-3.4.2-gcc47.patch

    for p in $srcdir/patch*; do
        patch -Np1 < $p
    done

    # skip compilation of demos and tests
    sed -i 's/test demo//' Makefile

    export CXXFLAGS="$(CXXFLAGS) -fpermissive"
    make OPTIMIZE=yes embedded_runpath_prefix=""
}

package() {
    cd ${srcdir}/Ice-$pkgver/cpp

    make prefix=${pkgdir}/usr/ install

    rm -rf ${pkgdir}/usr/config
    rm -rf ${pkgdir}/usr/LICENSE
    mkdir -p ${pkgdir}/usr/share/Ice-${pkgver}
    mv ${pkgdir}/usr/lib/ImportKey.class ${pkgdir}/usr/share/Ice-${pkgver}/

    if [ $CARCH = "x86_64" ]; then
        rm -rf ${pkgdir}/usr/lib
        mv ${pkgdir}/usr/lib{64,}
    fi

    mv ${pkgdir}/usr/slice ${pkgdir}/usr/share/Ice-${pkgver}/slice
    mkdir -p ${pkgdir}/usr/share/cmake-2.8/Modules/
    cp ${srcdir}/*.cmake ${pkgdir}/usr/share/cmake-2.8/Modules/

    mkdir -p ${pkgdir}/usr/share/licenses/zeroc-ice
    mv ${pkgdir}/usr/ICE_LICENSE \
                ${pkgdir}/usr/share/licenses/zeroc-ice/ICE_LICENSE
}

check() {
    cd ${srcdir}/Ice-$pkgver/cpp

    python2 allTests.py
}

md5sums=('e97672eb4a63c6b8dd202d0773e19dc7'
         'daadc3f7d5f7530c9a4e295646734e4e'
         '7e9b2a07fb4452b44383adf5320d76bc'
         '858db28d735255f25b184cb153f98b46'
         'b259e9758462cb152583e44de2dc0b2c'
         '98b8250c34a9cb445b5126da349c8e99'
         '2b99b8c117567ba53d71144274ed7d73'
         '8cedb428bdcdd60f0227cdb9a34b2415'
         '8edf4ce47e81aa8ae34781aedb4a5d25'
         'ec803e9f6d6df0fa798b0040c3eed7c3'
         '2a978eef6e05f7ef7f4f59859d6c5a33'
         '44f0ea80b2fffcad7db20dc32cc5b89b'
         '778007430be0fb0beaed0c744d28ec65'
         '378f9ce70bda4414920946084c7d89ef'
         '6b0b5f5276f54972eaec8ddbb49c4f15'
         '9196e2620953fe38ff7d262d8f20c6e5')
