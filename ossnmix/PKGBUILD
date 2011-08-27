# Maintainer: Quentin Foussette <quentinf7@gmail.com>

pkgname=ossnmix
pkgver=0.02
pkgrel=1
pkgdesc="A ncures-based mixer for OSS."
arch=('i686' 'x86_64')
url="http://ossnmix.sourceforge.net"
license=('GPL')
depends=('oss')
makedepends=()
source=('http://downloads.sourceforge.net/project/ossnmix/ossnmix-0.02.tar.bz2?r=http%3A%2F%2Fsourceforge.net%2Fprojects%2Fossnmix%2Ffiles%2F&ts=1281861252&mirror=switch')
md5sums=('63e8085fe1875fa40a4ddd50e4bc78b9')

build() {
  cd "$srcdir/$pkgname-$pkgver/src"
  make || return 1
}

package() {
  cd "$srcdir/$pkgname-$pkgver/src"
  mkdir -p "$pkgdir/usr/bin/"
  cp ossnmix "$pkgdir/usr/bin/" || return 1
}

# vim:set ts=2 sw=2 et:
