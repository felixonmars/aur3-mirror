# Maintainer : Lone_Wolf lonewolf@xs4all.nl
# Contributor: Steven She <mintcoffee@gmail.com>
# Contributor: vbPadre <vbpadre@gmail.com>

pkgname=cndrvcups-common
pkgver=2.56
pkgrel=1
pkgdesc="Common printer driver modules for Canon printers"
arch=('i686' 'x86_64')
url="http://support-in.canon-asia.com/contents/IN/EN/0100459601.html"
license=('GPL' 'MIT' 'custom')
  depends=('libglade')
if [[ ${CARCH} == "i686" ]]; then
  depends+=('glibc')
  _lib32dir="lib"
else
  depends+=('lib32-glibc')
  _lib32dir="lib32"
fi
makedepends=('automake' 'autoconf')
source=('http://gdlp01.c-wss.com/gds/6/0100004596/02/Linux_CAPT_PrinterDriver_V256_uk_EN.tar.gz')
options=('!emptydirs' '!strip')
md5sums=('3c5c1265d74088695d81808ba8672799')

build() {
#    unset LDFLAGS
    cd $srcdir/Linux_CAPT_PrinterDriver_V256_uk_EN/Src
    tar xf ${pkgname}-${pkgver}-1.tar.gz
        #prepare build directory
    rm -rf ${pkgname}-build
    cp -r "${pkgname}-${pkgver}-1" "${srcdir}/${pkgname}-build"
    cd "${srcdir}/${pkgname}-build"
    cd buftool
    sed -i 's/AM_CONFIG_HEADER/#AM_CONFIG_HEADER/' configure.in
    ./autogen.sh --prefix=/usr --enable-progpath=/usr/bin --libdir=/usr/lib
    make
    cd ../cngplp
    _cflags="${CFLAGS}"
    CFLAGS="${CFLAGS} $(pkg-config --cflags --libs gmodule-2.0)"
    sed -i 's/AM_CONFIG_HEADER/#AM_CONFIG_HEADER/' configure.in
    sed -i 's/AM_PROG_CC_STDC/#AM_PROG_CC_STDC/' configure.in
    ./autogen.sh --prefix=/usr --libdir=/usr/lib
    make
    CFLAGS="${_cflags}"
    cd ../c3plmod_ipc
    make 
    cd -
}
package()
{

    cd "${srcdir}/${pkgname}-build"
    mkdir -p ${pkgdir}/usr/{bin,lib,include}
    if [[ ${CARCH}=="x86_64" ]]; then
      mkdir -p ${pkgdir}/usr/${_lib32dir}
    fi
    mkdir -p ${pkgdir}/usr/share/{caepcm,cngplp,locale/ja/LC_MESSAGES}

    make install DESTDIR=${pkgdir}

    cd c3plmod_ipc
    make install DESTDIR=${pkgdir} LIBDIR=/usr/lib
    cd ..
    install -m 755 libs/libcaiowrap.so.1.0.0   ${pkgdir}/usr/${_lib32dir}
    install -m 755 libs/libcaiousb.so.1.0.0    ${pkgdir}/usr/${_lib32dir}

    install -m 755 libs/libc3pl.so.0.0.1     ${pkgdir}/usr/${_lib32dir}
    install -m 755 libs/libcaepcm.so.1.0     ${pkgdir}/usr/${_lib32dir}

    install -m 644 data/CA*  ${pkgdir}/usr/share/caepcm
    install -m 644 data/CNZ0*  ${pkgdir}/usr/share/caepcm

    install -s -m 755 libs/c3pldrv     ${pkgdir}/usr/bin

    install -m 755 libs/libcanon_slim.so.1.0.0   ${pkgdir}/usr/${_lib32dir}

    cd ${pkgdir}/usr/${_lib32dir}
    ln -sf libc3pl.so.0.0.1     libc3pl.so.0
    ln -sf libc3pl.so.0.0.1     libc3pl.so
    ln -sf libcaepcm.so.1.0     libcaepcm.so.1
    ln -sf libcaepcm.so.1.0     libcaepcm.so
    ln -sf libcaiowrap.so.1.0.0   libcaiowrap.so.1
    ln -sf libcaiowrap.so.1.0.0   libcaiowrap.so
    ln -sf libcaiousb.so.1.0.0    libcaiousb.so.1
    ln -sf libcaiousb.so.1.0.0    libcaiousb.so
    ln -sf libcanon_slim.so.1.0.0   libcanon_slim.so.1
    ln -sf libcanon_slim.so.1.0.0   libcanon_slim.so

    cd ${pkgdir}/usr/lib
    ln -sf libcanonc3pl.so.1.0.0    libcanonc3pl.so
    ln -sf libcanonc3pl.so.1.0.0    libcanonc3pl.so.1
    
    cd "${srcdir}/${pkgname}-build"
    install -m755 -d "${pkgdir}/usr/share/licenses/${pkgname}"
    install -m755 LICENSE-common-${pkgver}* ${pkgdir}/usr/share/licenses/${pkgname}
}
