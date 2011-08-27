# Maintainer: Deniz Erdogan <euda23@gmail.com>

pkgname=esrpatch
pkgver=0.2
pkgrel=1
pkgdesc="PS2 ISO patcher for ffgriever's ESR project."
arch=(i686)
url="http://psx-scene.com/forums/freevast/58441-esr-public-beta-36.html"
license=('GPL')
depends=()
makedepends=()
provides=()
options=()
install=
source=(esrpatch-0.2.tar.gz)
noextract=()
md5sums=('0b9ac6078c50246273ca7e298c83a24e')

build() {
  bsdtar -zxvvf esrpatch-0.2.tar.gz
  cd "$srcdir/esrpatch-0.2"
  gcc -o ./esrpatch main.c
  mkdir -p $pkgdir/usr/bin
  cp esrpatch $pkgdir/usr/bin
}
