# Maintainer: Onni R. <onnir at iki dot fi>
pkgname=esjit
pkgver=2
pkgrel=1
license=('None')
pkgdesc="a text-mode interface for handling JACK connections"
arch=('i686' 'x86_64')
url="http://github.com/lotuskip/esjit"
makedepends=('boost')
depends=('jack' 'boost-libs')
source=(http://tempoanon.net/lotuskip/tervat/$pkgname-$pkgver.tar.gz)
md5sums=('401519367607eb1c80126f18b118d80a')

build() {
  mkdir -p "${pkgdir}/usr/bin" || return 1
  cd $srcdir
  g++ -O2 -o $pkgdir/usr/bin/esjit esjit.cpp -ljack || return 1
  install -Dm644 esjit.1 $pkgdir/usr/share/man/man1/esjit.1
}

