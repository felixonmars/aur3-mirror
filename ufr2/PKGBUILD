# Contributor: Steven She <mintcoffee@gmail.com>
pkgname=ufr2
pkgver=2.00
pkgrel=1
pkgdesc="Canon URF2 driver with support for LBP, iR and MF series printers"
arch=('i686' 'x86_64')
url="http://support-au.canon.com.au/contents/AU/EN/0100270808.html"
license=('GPL')
depends=('libcups' "cndrvcups-common=$pkgver")
makedepends=('autoconf' 'automake')
source=('http://gdlp01.c-wss.com/gds/8/0100002708/01/UFR_II_Printer_Driver_for_Linux_V200_uk_EN.tar.gz')
options=('!emptydirs')
md5sums=('d83253ee5c3e719f9b1c8cac90f2cdef')

build() {
    unset LDFLAGS

    cd $srcdir/UFR_II_Printer_Driver_for_Linux_V200_uk_EN/Sources
    tar xf cndrvcups-lb-${pkgver}-2.tar.gz || return 1

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

    #Taken from debian install rules in package
    mkdir -p $pkgdir/usr/lib
    install -c libs/libcanonufr2.la $pkgdir/usr/lib || return 1
    install -c -s libs/libcanonufr2.so.1.0.0 $pkgdir/usr/lib || return 1
    install -c -s libs/libufr2filter.so.1.0.0 $pkgdir/usr/lib || return 1
	install -c -s libs/libEnoJBIG.so.1.0.0 $pkgdir/usr/lib || return 1
	install -c -s libs/libcaiocnpkbidi.so.1.0.0 $pkgdir/usr/lib || return 1

    mkdir -p $pkgdir/usr/bin
	install -c -s libs/cnpkbidi $pkgdir/usr/bin || return 1

    #Taken from debian install rules in package
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

    # From debian rules (files are needed according to aur comments)
	# rm -rf $pkgdir/usr/share/cups/model/*ZK.ppd || return 1
	# rm -rf $pkgdir/usr/share/cups/model/*ZS.ppd || return 1
}
