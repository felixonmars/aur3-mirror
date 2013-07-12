# Maintainer: Christian Neukirchen <chneukirchen@gmail.com>
pkgname=openbsd-rs-git
pkgver=20130712
pkgrel=1
pkgdesc="reshape a data array"
arch=('i686' 'x86_64')
url="https://github.com/chneukirchen/rs"
license=('BSD')
depends=('libbsd')
makedepends=('git')
source=('git://github.com/chneukirchen/rs.git')
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/rs"
  git log -1 --format="%cd" --date=short | sed 's|-||g'
}

build() {
  cd "$srcdir/rs"
  make
}

package() {
  cd "$srcdir/rs"
  install -D -m755 rs "$pkgdir/usr/bin/rs"
  install -D -m644 rs.1 "$pkgdir/usr/share/man/man1/rs.1"
  install -D -m644 README "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

# vim:set ts=2 sw=2 et:
