#Maintainer: yescalona <yescalona at ug dot uchile dot com>

pkgname=pulchra
pkgver=306
pkgrel=1
pkgdesc="Simple tool for all-atom reconstruction and refinement of reduced protein models."
arch=('i686')
url="http://www.pirx.com/pulchra/"
license=('MIT')
groups=()
depends=('glibc')
makedepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
source=(http://www.pirx.com/cgi-bin/download.cgi?$pkgname\_$pkgver.tgz)
noextract=()
md5sums=('ae0803db00dfd6f0a4ad0132f23fe17a')

build() {
  cd $srcdir/$pkgname\_$pkgver
  cc -O3 -o pulchra pulchra.c pulchra_data.c -lm || return 1
  install -d $pkgdir/usr/bin/ || return 1
  install -d $pkgdir/usr/share/licenses/$pkgname
  install -D $pkgname $pkgdir/usr/bin/ || return 1
  install -D -m644 LICENSE $pkgdir/usr/share/licenses/$pkgname/ || return 1
}
