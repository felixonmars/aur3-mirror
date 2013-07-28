# Maintainer: John Hall <hall.john.wesley@gmail.com>
pkgname=fdnsc
pkgver=1.0
pkgrel=2
epoch=
pkgdesc="A freedns.afraid.org dynamic DNS update client"
arch=(any)
url="http://freedns.afraid.org/scripts/freedns.clients.php"
license=('GPL')
groups=()
depends=('wget' 'sed' 'coreutils' 'util-linux')
makedepends=()
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=('etc/fdnsc.conf')
options=()
install=
changelog=
source=(fdnsc fdnsc.service fdnsc.conf)
noextract=(fdnsc fdnsc.service fdnsc.conf)
md5sums=('8597215ecfdae8f69fafd07f8b96d688'
         'a0a2cd726b0e2d9c04c4c805b988f615'
         '90a3ce01410715beff5835f9408722d7')

#build() {
#}

#check() {
#}

package() {
  mkdir -p $pkgdir/usr/bin
  cp -p fdnsc $pkgdir/usr/bin/fdnsc
  mkdir -p $pkgdir/usr/lib/systemd/system
  cp -p fdnsc.service $pkgdir/usr/lib/systemd/system/fdnsc.service
  mkdir -p $pkgdir/etc
  cp -p fdnsc.conf $pkgdir/etc/fdnsc.conf
}
