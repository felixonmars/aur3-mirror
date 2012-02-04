# Contributor: Firmicus <firmicus āt gmx dōt net>
# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>

pkgname=xrmap
pkgver=2.34
pkgrel=2
pkgdesc="X client for generating images of the Earth and manipulating the CIA World data bank II global vector information"
arch=('i686' 'x86_64')
url="http://frmas.free.fr/li_1.htm#_Xrmap_"
license=('GPL')
depends=('bzip2' 'libjpeg' 'libpng' 'libxpm')
makedepends=('imake')
optdepends=('xorg-server-utils')
install=xrmap.install
source=(arch.patch \
  ftp://ftp.ac-grenoble.fr/ge/geosciences/xrmap/$pkgname-$pkgver.tar.bz2 \
  ftp://ftp.ac-grenoble.fr/ge/geosciences/xrmap/data/CIA_WDB2.jpd.bz2 \
  ftp://ftp.ac-grenoble.fr/ge/geosciences/xrmap/data/flags-2.9-eps.tar.bz2 \
  ftp://ftp.ac-grenoble.fr/ge/geosciences/xrmap/data/earthdata_low_res.tar.bz2 \
  ftp://ftp.ac-grenoble.fr/ge/geosciences/xrmap/data/factbook_text_2006.tar.bz2 \
  ftp://ftp.ac-grenoble.fr/ge/geosciences/xrmap/data/anthems-1.3.tar.bz2 \
  ftp://ftp.ac-grenoble.fr/ge/geosciences/xrmap/data/hymns-1.4.tar.bz2)
md5sums=('2f2fc217e3c312ccfc2080c2d32ef5b9' 'd5ea6c95b1ac0d707ceb39ee6282a3cd'\
         '8b5255a685bbb5eef2f86df182731a32' '9df0819ef558796442cfc72784c9b92e'\
         'd759385d85aafbe50e5bca125f8d65a0' 'de6282e74556b4eb82266036fdbba8a8'\
         '7e8f454f7ad04776c6455b75225630bf' '682dfd893b2ed46c175e6c0a2374cbbe')

build() {
  cd $srcdir/$pkgname-$pkgver
  install -d \
    $pkgdir/usr/share/{doc/xrmap,man/man1,man/man1x,$pkgname/flags,}
  
  patch -p1 < ../arch.patch || return 1
  cd editkit
  xmkmf || return 1
  make || return 1
  install -Dm755 emx $pkgdir/usr/bin/emx || return 1
  cd ..
  #xmkmf || return 1
  #sed -i 's+lib64+lib+g' Makefile || return 1
  # # the author forgot to update version.h
  # sed -i 's/2\.33/2\.33\.1/' version.h
  # sed -i 's/November 1/November 17/' version.h
  cp Makefile.noimake Makefile || return 1
  make || return 1
  make DESTDIR=$pkgdir/usr install || return 1
  cd $srcdir
  _datadir=$pkgdir/usr/share/xrmap
  cp -f CIA_WDB2.jpd $_datadir
  cp -fR anthems $_datadir
  cp -fR earthdata $_datadir
  cp -fR factbook $_datadir
  cp -fR flags $_datadir
  cp -fR hymns $_datadir
  chmod 644 $pkgdir/usr/share/xrmap/i18n/xrmap_msg.de
}
