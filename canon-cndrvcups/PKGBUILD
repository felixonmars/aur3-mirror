# Contributor: vbPadre <vbpadre@gmail.com>
# Contributor: thesilverring <emalnotsupplied@gmail.com>
pkgname=canon-cndrvcups
pkgver=2.30
pkgrel=1
pkgversionname=`echo $pkgver|sed -e 's#\.##'`
pkgdesc="Canon Printer Driver Common Module for Linux"
arch=('i686' 'x86_64')
url="http://www.usa.canon.com/cusa/support/consumer/printers_multifunction/imageclass_series"
license=('GPL' 'MIT' 'custom')
depends=('libcups' 'gtk2' 'libglade' 'libxml2')
makedepends=('automake' 'autoconf')
source=("http://gdlp01.c-wss.com/gds/0/0100003440/02/Linux_UFRII_PrinterDriver_V${pkgversionname}_us_EN.tar.gz")
options=('!emptydirs')
md5sums=('223a4019a79d3229f81cc6e37d8f3a8a')
build() {
    unset LDFLAGS

    cd $srcdir/Linux_UFRII_PrinterDriver_V${pkgversionname}_us_EN/Sources
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
    cd c3plmod_ipc
    make && \
    make DESTDIR=${pkgdir} LIBDIR=/usr/lib install
    ) || return 1

   
    install -c -m 4755 libs/c3pldrv    $pkgdir/usr/bin

    install -c -m 755 libs/libcaiowrap.so.1.0.0 $pkgdir/usr/lib
    install -c -m 755 libs/libcaiousb.so.1.0.0 $pkgdir/usr/lib
    install -c -m 755 libs/libc3pl.so.0.0.1 $pkgdir/usr/lib
    install -c -m 755 libs/libcaepcm.so.1.0 $pkgdir/usr/lib
    install -c -m 755 c3plmod_ipc/libcanonc3pl.so.1.0.0 $pkgdir/usr/lib
    install -c -m 755 libs/libcanon_slim.so.1.0.0 $pkgdir/usr/lib

    (
    cd $pkgdir/usr/lib/
    ln -sf libc3pl.so.0.0.1 libc3pl.so.0
    ln -sf libc3pl.so.0.0.1 libc3pl.so
    ln -sf libcaepcm.so.1.0 libcaepcm.so.1
    ln -sf libcaepcm.so.1.0 libcaepcm.so
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


    cd $srcdir/Linux_UFRII_PrinterDriver_V${pkgversionname}_us_EN/Sources
    tar xf cndrvcups-lb-${pkgver}-1.tar.gz || return 1

    cd cndrvcups-lb-$pkgver

    ( cd ppd && \
    ./autogen.sh --prefix=/usr \
    --enable-shared \
    --disable-static \
    --program-suffix="" \
    --program-prefix="" && \
    make) || return 1

    ( cd pstoufr2cpca && \
    ./autogen.sh --prefix=/usr \
    --enable-progpath=/usr/bin \
    --enable-shared \
    --disable-static \
    --program-suffix="" \
    --program-prefix="" && \
    make) || return 1

    ( cd backend && \
    ./autogen.sh --prefix=/usr \
    --enable-shared \
    --disable-static \
    --program-suffix="" \
    --program-prefix="" && \
    make) || return 1

    (
    cd cpca
    ./autogen.sh --prefix=/usr && \
    make && \
    make DESTDIR=${pkgdir} LIBDIR=/usr/lib install
    ) || return 1

    (
    cd cngplp
    ./autogen.sh --prefix=/usr && \
    ./configure --prefix=/usr && \
    make && \
    make DESTDIR=${pkgdir} install
    ) || return 1

    make DESTDIR=${pkgdir} install || return 1
    mkdir -p $pkgdir/usr/lib
    install -c libs/libcanonufr2.la $pkgdir/usr/lib || return 1
    install -c -s libs/libcanonufr2.so.1.0.0 $pkgdir/usr/lib || return 1
    install -c -s libs/libufr2filter.so.1.0.0 $pkgdir/usr/lib || return 1
    install -c -s libs/libEnoJBIG.so.1.0.0 $pkgdir/usr/lib || return 1
    install -c -s libs/libcaiocnpkbidi.so.1.0.0 $pkgdir/usr/lib || return 1

    mkdir -p $pkgdir/usr/bin
    install -c -s libs/cnpkbidi $pkgdir/usr/bin || return 1

    ( 
    cd $pkgdir/usr/lib
    ln -sf libcanonufr2.so.1.0.0  liblibcanonufr2.so.1
    ln -sf libcanonufr2.so.1.0.0  libcanonufr2.so
    ln -sf libufr2filter.so.1.0.0 libufr2filter.so.1
    ln -sf libufr2filter.so.1.0.0  libufr2filter.so
    ln -sf libEnoJBIG.so.1.0.0	libEnoJBIG.so.1
    ln -sf libEnoJBIG.so.1.0.0	libEnoJBIG.so
    ln -sf libcaiocnpkbidi.so.1.0.0	libcaiocnpkbidi.so.1
    ln -sf libcaiocnpkbidi.so.1.0.0	libcaiocnpkbidi.so
    ) || return 1

    mkdir -p $pkgdir/usr/share/caepcm
    install -c -m 644 data/C*   $pkgdir/usr/share/caepcm || return 1

    mkdir -p $pkgdir/usr/share/cnpkbidi
	install -c -m 644 libs/cnpkbidi*   $pkgdir/usr/share/cnpkbidi || return 1

	mkdir -p $pkgdir/usr/share/ufr2filter
	install -c -m 644 libs/ThLB*   $pkgdir/usr/share/ufr2filter || return 1

}
