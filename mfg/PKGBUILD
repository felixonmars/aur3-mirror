# Maintainer: mockfrog <arch AT mockfrog DOT de>
pkgname=mfg
pkgver=2.4
pkgrel=1
pkgdesc="a fairly simple (template-based) makefile generator"
arch=(x86 x86_64)
url="http://www.informatik.uni-osnabrueck.de/elmar/projects/mfg"
license=('GPL2')
source=(ftp://ftp.inf.uos.de/pub/elmar/mfg/$pkgname-$pkgver.tar.gz)
md5sums=('48983bcc9d5327261f92bfbf8967852d')

build() {
  cd "$srcdir/$pkgname-$pkgver"

  ./configure --prefix=/usr  
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"

  make prefix="$pkgdir/" install
  install -m 755 -d "$pkgdir/usr"
  mv "$pkgdir/man"   "$pkgdir/share/"
  mv "$pkgdir/share" "$pkgdir/usr/"
}

# vim:set ts=2 sw=2 et:
