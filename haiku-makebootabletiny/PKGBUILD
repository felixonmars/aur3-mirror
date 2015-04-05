# Maintainer: Thiago Perrotta <perrotta dot thiago at poli dot ufrj dot br>
pkgname=haiku-makebootabletiny
pkgver=1
pkgrel=1
pkgdesc="Haiku's makebootabletiny program"
arch=('any')
url='https://www.haiku-os.org/guides/booting/makebootable'
license=('MIT')
source=('http://stefanschramm.net/dev/makebootabletiny/makebootabletiny.c')
md5sums=('7c745ac7d3c69a4796545c2338a9f25e')
sha256sums=('d7576c260ad617ce35576098e388c8ef67a301af8104aaefe0809a89272aa378')

build() {
  cd "$srcdir"
  gcc makebootabletiny.c -o makebootabletiny
}

package() {
  cd "$srcdir"
  install -Dm755 makebootabletiny "$pkgdir/usr/bin/makebootabletiny"
}
