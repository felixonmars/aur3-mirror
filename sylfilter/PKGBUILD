# Maintainer: speps <speps at aur dot archlinux dot org>

pkgname=sylfilter
pkgver=0.8
pkgrel=1
pkgdesc="A generic message filter library and command-line tools."
arch=(i686 x86_64)
url="http://sylpheed.sraoss.jp/$pkgname/"
license=('BSD')
depends=('glib2' 'sqlite3')
options=('!libtool')
source=("${url}src/$pkgname-$pkgver.tar.gz")
md5sums=('c3c34cb766bd157d115108517298f63c')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  ./configure --prefix=/usr \
              --enable-static=no
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make DESTDIR="$pkgdir/" install

  # license
  install -Dm644 COPYING \
    "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

# vim:set ts=2 sw=2 et:
