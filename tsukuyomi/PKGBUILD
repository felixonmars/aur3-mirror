# Contributor: Anton Bazhenov <anton.bazhenov at gmail>
# Maintainer: Nathan Jones <nathanj@insightbb.com>

pkgname=tsukuyomi
pkgver=0.01
pkgrel=2
pkgdesc="A tool to create and apply UPS patches"
arch=('i686' 'x86_64')
url="http://www.byuu.org/programming/"
license=('unknown')
depends=('gtk2' 'libxtst')
source=(http://byuu.org/files/${pkgname}_v${pkgver/0./}.tar.bz2)
md5sums=('9584ebae65ba0508700fcb3bf94220f4')

build() {
  cd "$srcdir"/$pkgname
  sh cc.sh
  install -Dm755 $pkgname "$pkgdir"/usr/bin/$pkgname
}
