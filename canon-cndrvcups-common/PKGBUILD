# Contributor: vbPadre <vbpadre@gmail.com>
pkgname=canon-cndrvcups-common
pkgver=2.20
pkgrel=1
pkgdesc="Canon Printer Driver Common Module for Linux"
arch=('i686' 'x86_64')
url="http://support-au.canon.com.au/"
license=('GPL' 'MIT' 'custom')
depends=('libcups' 'gtk2' 'libglade' 'libxml2')
makedepends=('automake' 'autoconf')
source=('http://gdlp01.c-wss.com/gds/8/0100002708/03/UFR_II_Printer_Driver_for_Linux_V220_uk_EN.tar.gz')
options=('!emptydirs')
md5sums=('e4a6ecb8ad4b00bc92f4acdac65ec66b')
build() {
    unset LDFLAGS

    cd $srcdir/UFR_II_Printer_Driver_for_Linux_V220_uk_EN/Sources
    tar xf cndrvcups-common-${pkgver}-1.tar.gz || return 1

    cd cndrvcups-common-${pkgver}

    (
    cd cngplp
    ./autogen.sh --prefix=/usr && \
    make && \
    make DESTDIR=${pkgdir} install
    ) || return 1

    (
    cd buftool
    ./autogen.sh --prefix=/usr && \
    make && \
    make DESTDIR=${pkgdir} LIBDIR=/usr/lib install
    ) || return 1

    (
    cd cpca
    ./autogen.sh --prefix=/usr && \
    make && \
    make DESTDIR=${pkgdir} LIBDIR=/usr/lib install
    ) || return 1

    (
    cd c3plmod_ipc
    make && \
    make DESTDIR=${pkgdir} LIBDIR=/usr/lib install
    ) || return 1

    install -c -m 4755 libs/cnpkmodule $pkgdir/usr/bin
    install -c -m 4755 libs/c3pldrv    $pkgdir/usr/bin

    install -c -m 755 libs/libcaiowrap.so.1.0.0 $pkgdir/usr/lib
    install -c -m 755 libs/libcaiousb.so.1.0.0 $pkgdir/usr/lib
    install -c -m 755 libs/libc3pl.so.0.0.1 $pkgdir/usr/lib
    install -c -m 755 libs/libcnaccm.so.1.0 $pkgdir/usr/lib
    install -c -m 755 libs/libcaepcm.so.1.0 $pkgdir/usr/lib
    install -c -m 755 libs/libcnlbcm.so.1.0 $pkgdir/usr/lib
    install -c -m 755 c3plmod_ipc/libcanonc3pl.so.1.0.0 $pkgdir/usr/lib
    install -c -m 755 libs/libcanon_slim.so.1.0.0 $pkgdir/usr/lib

    (
    cd $pkgdir/usr/lib/
    ln -sf libc3pl.so.0.0.1 libc3pl.so.0
    ln -sf libc3pl.so.0.0.1 libc3pl.so
    ln -sf libcnaccm.so.1.0 libcnaccm.so.1
    ln -sf libcnaccm.so.1.0 libcnaccm.so
    ln -sf libcaepcm.so.1.0 libcaepcm.so.1
    ln -sf libcaepcm.so.1.0 libcaepcm.so
    ln -sf libcnlbcm.so.1.0 libcnlbcm.so.1
    ln -sf libcnlbcm.so.1.0 libcnlbcm.so
    ln -sf libcaiowrap.so.1.0.0 libcaiowrap.so.1
    ln -sf libcaiowrap.so.1.0.0 libcaiowrap.so
    ln -sf libcaiousb.so.1.0.0 libcaiousb.so.1
    ln -sf libcaiousb.so.1.0.0 libcaiousb.so
    ln -sf libcanonc3pl.so.1.0.0 libcanonc3pl.so.1
    ln -sf libcanonc3pl.so.1.0.0 libcanonc3pl.so
    ln -sf libcanon_slim.so.1.0.0 libcanon_slim.so.1
    ln -sf libcanon_slim.so.1.0.0 libcanon_slim.so
    ) || return 1

    mkdir -p $pkgdir/usr/share/caepcm
    install -c -m 644 data/CA*    $pkgdir/usr/share/caepcm
    install -c -m 644 data/CNZ0*  $pkgdir/usr/share/caepcm
}