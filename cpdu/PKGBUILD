# Maintainer: TDY <tdy@archlinux.info>

pkgname=cpdu
pkgver=0.3.82b
pkgrel=1
pkgdesc="A cryptographic package distribution utility for archiving encrypted files"
arch=('i686' 'x86_64')
url="http://freshmeat.net/projects/cpdu/"
license=('GPL')
source=(http://kde-apps.org/CONTENT/content-files/92074-$pkgname-$pkgver.tar.gz)
md5sums=('4ed00c85f3f34965bf2be6cafa6960c2')

build() {
  cd "$srcdir/$pkgname"
  make prefix=/usr
}

package() {
  install -Dm755 "$srcdir/$pkgname/$pkgname" "$pkgdir/usr/bin/$pkgname"
}

# vim:set ts=2 sw=2 et:
