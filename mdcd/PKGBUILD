# Contributor: cryke <cryke@ya.ru>

pkgname=mdcd
pkgver=0.0.1
pkgrel=1
pkgdesc="console file downloader for Murmansk.Data.Cod.Ru" 
arch=(i686 x86_64)
url="http://mdcd.googlecode.com"
license=('BSD')
depends=('wget')
source=(http://mdcd.googlecode.com/files/$pkgname-$pkgver.tar.bz2)
md5sums=('d3954d57ac6f6a00e4a727dd627cb141')
build() {
  cd "$srcdir/$pkgname-$pkgver"
  install -d $pkgdir/usr/bin

  make || return 1
  make DESTDIR="$pkgdir" install clean
}

