# Maintainer: Stefan Husmann <Stefan-Husmann@t-online.de>
# Contributor: Stefan Husmann <Stefan-Husmann@t-online.de>

pkgname=dklibs
pkgver=1.23.1
pkgrel=1
arch=('i686' 'x86_64')
pkgdesc="Libraries used by bmeps"
url="http://dklibs.sourceforge.net/"
license=('custom:BSD')
depends=('zlib' 'bzip2')
optdepends=('netpbm: for certain file format conversions')
source=(http://downloads.sourceforge.net/$pkgname/$pkgname-$pkgver.tar.gz)
md5sums=('5d6b38ebfc50aa2983684537dd30dceb')
backup=('etc/$pkgname/appdefaults')
options=('!emptydirs')

build() {
  cd $srcdir/$pkgname-$pkgver
  ./configure --prefix=/usr --sysconfdir=/etc/$pkgname \
    --mandir=/usr/share/man || return 1
  make || return 1 
  make pp=$pkgdir install || return 1
  install -Dm644 $srcdir/$pkgname-$pkgver/bsdlic.txt \
    $pkgdir/usr/share/licenses/$pkgname/bsdlic.txt || return 1
}

