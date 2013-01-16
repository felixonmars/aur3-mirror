# Maintainer:  TDY <tdy@archlinux.info>
# Contributor: Philipp Sandhaus <philipp.sandhaus@gmx.de>
# Contributor: Nathan O <ndowens.aur at gmail.com>

pkgname=cdplay
pkgver=0.3.8
pkgrel=4
pkgdesc="A small command-line driven CD player"
url="http://www.rkeene.org/oss/cdplay/"
arch=('i686' 'x86_64')
license=('GPL2')
depends=('glibc')
source=(http://www.rkeene.org/files/oss/cdplay/${pkgname}-${pkgver}.tar.gz)
md5sums=('6a9866f5425434932c329f366b4bd534')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  install -Dm755 $pkgname "$pkgdir/usr/bin/$pkgname"
  ln -s $pkgname "$pkgdir/usr/bin/eject"
}

# vim:set ts=2 sw=2 et:
