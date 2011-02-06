# Contributor: AddiKT1ve <the.addikt1ve@gmail.com>
pkgname=lolbash
pkgver=1
pkgrel=1
pkgdesc="Brings lolz to your bash"
arch=('i686')
url="http://www.doneed.net"
license=('GPL')
depends=(bash)
install=(lolbash.install)
source=(lolbash.sh)
md5sums=('33920f174faca40edcfcaf877bb7673c')

build() {
	install -D -m755 ${startdir}/lolbash.sh ${startdir}/pkg/etc/profile.d/lolbash.sh
}
