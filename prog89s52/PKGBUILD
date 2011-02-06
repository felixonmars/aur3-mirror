# Contributor: Luiz Ribeiro (venox) <luizribeiro@gmail.com>

pkgname=prog89s52
pkgver=1.0
pkgrel=1
pkgdesc="prog89S52 is a utility for Linux on the PC, allowing programming of Atmel's AT89S52 microcontroller via the parallel printer port."
arch=(i686)
url="http://www.8052.com/users/tomi/"
license=('GPL')
depends=()
source=(http://www.8052.com/users/tomi/prog89S52-$pkgver.c http://www.8052.com/users/tomi/prog89S52.1)
md5sums=('72ec04f5e679740ec1210b1c70289f80' '42773dec4f4bec77ade9053d272a30df')

build() {
  cd $startdir/src
  gcc prog89S52-1.0.c -o prog89S52 -lm
  mkdir -p $startdir/pkg/usr/{man/man1,bin}
  install -m644 prog89S52.1 $startdir/pkg/usr/man/man1
  install -m755 prog89S52 $startdir/pkg/usr/bin
}
