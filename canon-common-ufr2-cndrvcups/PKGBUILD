# Contributor: vbPadre <vbpadre@gmail.com>

pkgname=canon-common-ufr2-cndrvcups
pkgver=1.90
pkgrel=5
pkgdesc="Canon common printer driver modules and URF2 driver with support for LBP, iR and MF series printers"
arch=('i686' 'x86_64')
url="http://www.canon.com.au/"
license=('custom')
depends=('libcups' 'cairo' 'freetype2' 'gtk2')
makedepends=('automake' 'autoconf')
source=('http://www.ktulxu.com/files/canon/printer/drv/cndrvcups-common-1.90-1.tar.gz' 'http://www.ktulxu.com/files/canon/printer/drv/cndrvcups-lb-1.90-1.tar.gz')
md5sums=('564d49f96735727eaad32821f8b6d00c' 'baa4c2c1353bcf78398c70e90783ffa6')

build() {

cd $srcdir/cndrvcups-common-$pkgver

cd $srcdir/cndrvcups-common-$pkgver/buftool
./autogen.sh --prefix=/usr --enable-progpath=/usr/bin --libdir=/usr/lib --disable-shared --enable-static

cd $srcdir/cndrvcups-common-$pkgver/cpca
./autogen.sh --prefix=/usr --enable-progpath=/usr/bin --libdir=/usr/lib --enable-shared --disable-static

cd $srcdir/cndrvcups-common-$pkgver/cngplp
./autogen.sh --libdir=/usr/lib 

cd $srcdir/cndrvcups-common-$pkgver
make

cd $srcdir/cndrvcups-common-$pkgver/c3plmod_ipc
make 
cd -

mkdir -pv $pkgdir/usr/bin
mkdir -pv $pkgdir/usr/bin/local/bin
mkdir -pv $pkgdir/usr/lib
mkdir -pv $pkgdir/usr/include
mkdir -pv $pkgdir/usr/local/share/locale/ja/LC_MESSAGES
mkdir -pv $pkgdir/usr/share/caepcm
mkdir -pv $pkgdir/usr/lib

cd $srcdir/cndrvcups-common-$pkgver
make install DESTDIR=$pkgdir 

cd $srcdir/cndrvcups-common-$pkgver/c3plmod_ipc
make install DESTDIR=$pkgdir LIBDIR=/usr/lib
cd - 

cd $srcdir/cndrvcups-common-$pkgver
install -c -m 4755 libs/cnpkmodule $pkgdir/usr/bin
install -c -m 755 libs/libcaiowrap.so.1.0.0 $pkgdir/usr/lib
install -c -m 755 libs/libcaiousb.so.1.0.0 $pkgdir/usr/lib
install -c -m 755 libs/libc3pl.so.0.0.1 $pkgdir/usr/lib
install -c -m 755 libs/libcnaccm.so.1.0 $pkgdir/usr/lib
install -c -m 755 libs/libcaepcm.so.1.0 $pkgdir/usr/lib
install -c -m 755 libs/libcnlbcm.so.1.0 $pkgdir/usr/lib
install -c -m 644 data/CA* $pkgdir/usr/share/caepcm
install -c -m 644 data/CNZ0* $pkgdir/usr/share/caepcm
install -c -s -m 755 libs/c3pldrv $pkgdir/usr/bin
install -c -m 755 libs/libcanon_slim.so.1.0.0 $pkgdir/usr/lib

cd $pkgdir/usr/lib
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
ln -sf libcanon_slim.so.1.0.0 libcanon_slim.so.1
ln -sf libcanon_slim.so.1.0.0 libcanon_slim.so
cd -

cd $pkgdir/usr/lib
ln -sf libcanonc3pl.so.1.0.0 libcanonc3pl.so
ln -sf libcanonc3pl.so.1.0.0 libcanonc3pl.so.1




cd $srcdir/cndrvcups-lb-$pkgver

cd $srcdir/cndrvcups-lb-$pkgver/ppd
./autogen.sh --prefix=/usr

cd $srcdir/cndrvcups-lb-$pkgver/pstoufr2cpca
./autogen.sh --prefix=/usr --libdir=/usr/lib

cd $srcdir/cndrvcups-lb-$pkgver
make

mkdir -p $pkgdir/usr/bin
mkdir -p $pkgdir/usr/lib
mkdir -p $pkgdir/usr/lib
mkdir -p $pkgdir/usr/lib/cups/filter
mkdir -p $pkgdir/usr/share/cups/model
mkdir -p $pkgdir/usr/share/caepcm
mkdir -p $pkgdir/usr/share/cnpkbidi

cd $srcdir/cndrvcups-lb-$pkgver
make install DESTDIR=$pkgdir

install -c    -m 755 libs/libcanonufr2.la $pkgdir/usr/lib
install -c -s -m 755 libs/libcanonufr2.so.1.0.0 $pkgdir/usr/lib
install -c -s -m 755 libs/libufr2filter.so.1.0.0 $pkgdir/usr/lib
install -c -s -m 755 libs/libEnoJBIG.so.1.0.0 $pkgdir/usr/lib
install -c -s -m 755 libs/cnpkbidi $pkgdir/usr/bin
install -c -s -m 755 libs/libcaiocnpkbidi.so.1.0.0 $pkgdir/usr/lib

install -c -m 644 data/CNC*	$pkgdir/usr/share/caepcm
install -c -m 644 data/CNL6*	$pkgdir/usr/share/caepcm
install -c -m 644 data/CNL8*	$pkgdir/usr/share/caepcm
install -c -m 644 data/CNLC*	$pkgdir/usr/share/caepcm
install -c -m 644 data/CnLB*	$pkgdir/usr/share/caepcm
install -c -m 644 libs/cnpkbidi_info*	$pkgdir/usr/share/cnpkbidi

cd $pkgdir/usr/lib
ln -sf libcanonufr2.so.1.0.0 libcanonufr2.so
ln -sf libcanonufr2.so.1.0.0 libcanonufr2.so.1
ln -sf libufr2filter.so.1.0.0 libufr2filter.so
ln -sf libufr2filter.so.1.0.0 libufr2filter.so.1
ln -sf libEnoJBIG.so.1.0.0 libEnoJBIG.so
ln -sf libEnoJBIG.so.1.0.0 libEnoJBIG.so.1
ln -sf libcaiocnpkbidi.so.1.0.0 libcaiocnpkbidi.so
ln -sf libcaiocnpkbidi.so.1.0.0 libcaiocnpkbidi.so.1
cd -

}  
