# Author: mar77i <mysatyre@gmail.com>
pkgname=fchvt
pkgver=0.1.1
pkgrel=2
pkgdesc="A bash script that corrects the console font discrepancies"
arch=('i686' 'x86_64')
url="http://mar77i.orgfree.com/pub/fchvt"
license=('wtfpl')
groups=()
depends=()
makedepends=(bash kbd)
provides=()
source=(http://mar77i.orgfree.com/pub/fchvt)
noextract=()
md5sums=('756b481653b67b87e870792607ce3212')

build() {
  cd "$srcdir" || return 1
  install -D -m755 fchvt $pkgdir/usr/bin/fchvt || return 1
}