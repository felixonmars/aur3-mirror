# Contributor: Lex Rivera <x-demon@x-demon.org>
pkgname=netsharer
_gcname=netsharer4linux
pkgver=0.4.9
pkgrel=1
pkgdesc="A simple net sharer tool for linux"
arch=('i686' 'x86_64')
url="http://code.google.com/p/$_gcname/"
license=('GPL2')
depends=('qt' 'freetype2' 'zlib' 'openssl')
makedepends=('')
optdepends=()
conflicts=()
source=(http://$_gcname.googlecode.com/files/$pkgname-$pkgver.tar.gz)
md5sums=('43e4c5b30f8b3e0f8a3514f8025e41a7')

build() {
  cd $srcdir/$pkgname-$pkgver
  qmake
  make || return 1
  mkdir -p ${pkgdir}/usr/bin
  install -Dm755 $srcdir/$pkgname-$pkgver/netsharer ${pkgdir}/usr/bin || return 1
}
# vim:syntax=sh
