# Contributor: vbPadre <vbPadre@gmail.com>
pkgname=canon-cndrvcups-lb
pkgver=2.10
pkgrel=1
pkgdesc="Canon UFR II / LIPSLX Printer Driver for Linux with support for LBP, iR and MF series printers"
arch=('i686' 'x86_64')
url="http://support-au.canon.com.au/"
license=('GPL')
depends=('libcups' "canon-cndrvcups-common=$pkgver")
makedepends=('autoconf' 'automake')
source=('http://gdlp01.c-wss.com/gds/8/0100002708/02/UFR_II_Printer_Driver_for_Linux_V210_uk_EN.tar.gz')
options=('!emptydirs')
md5sums=('f3e07852d3fa628697bf1c8ee6b6b14e')

build() {
    unset LDFLAGS

    cd $srcdir/UFR_II_Printer_Driver_for_Linux_V210_uk_EN/Sources
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
