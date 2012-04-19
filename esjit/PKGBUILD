# Maintainer: Onni R. <onnir at iki dot fi>
pkgname=esjit
pkgver=3
pkgrel=1
license=('None')
pkgdesc="a text-mode interface for handling JACK connections"
arch=('i686' 'x86_64')
url="http://github.com/lotuskip/esjit"
makedepends=('boost')
depends=('jack' 'boost-libs')
source=(http://github.com/downloads/lotuskip/esjit/$pkgname-$pkgver.tar.gz)
md5sums=('873038057ffe096610e5472deb170723')

build() {
  mkdir -p "${pkgdir}/usr/bin"
  cd $srcdir
  g++ -O2 -o $pkgdir/usr/bin/esjit esjit.cpp -ljack
  install -Dm644 esjit.1 $pkgdir/usr/share/man/man1/esjit.1
}

