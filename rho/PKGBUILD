# Maintainer: SpepS <dreamspepser at yahoo dot it>

pkgname=rho
pkgver=1.1.14
pkgrel=1
pkgdesc="A small, very configurable console-based text editor."
arch=(i686 x86_64)
url="http://rho.tuxfamily.org/"
license=('custom:CC BY-NC-SA')
depends=('ncurses')
install="$pkgname.install"
source=("$url$pkgname-$pkgver.tar.bz2")
md5sums=('1bbd19f35c65fcb2a00aaf23b6e67820')

build() {
  cd "$srcdir/$pkgname-$pkgver"

  # force DESTDIR in Makefile
  sed -i "s|usr/local|$pkgdir/usr|g;/rhorc/d" Makefile

  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"

  # prepare dirs
  install -d "$pkgdir"/usr/share/{licenses,doc,}/$pkgname

  make install

  # docs
  mv "$pkgdir/usr/share/$pkgname/"{README,*.txt} \
    "$pkgdir/usr/share/doc/$pkgname"

  # license
  mv "$pkgdir/usr/share/$pkgname/LICENSE" \
    "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

# vim:set ts=2 sw=2 et:
