# Contributor: Nils Schweinsberg <mail@n-sch.de>
pkgname=npaste-client
pkgver=0.2
pkgrel=1
pkgdesc="client for the npaste.de pastebin"
arch=('i686' 'x86_64')
url="http://npaste.de"
license=('NONE')
depends=('curl')
source=(http://npaste.de/client/${CARCH}/np)
[ "${CARCH}" == 'i686'   ] && md5sums=('23ef8521c35443dfef28133d7bb29bf0')
[ "${CARCH}" == 'x86_64' ] && md5sums=('5ba18cf835415853bb54da58cc5f7e42')

build() {
  cd "$srcdir"
  install -D -m755 np $pkgdir/usr/bin/npaste
}
