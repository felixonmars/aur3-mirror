# Maintainer: Kevin Mason <kmason@bloodstar.net>
pkgname=sxd
pkgver=20120411
pkgrel=1
pkgdesc="A daemon to start X as a specified non-root user."
arch=('i686' 'x86_64')
license=('GPL')
depends=('xorg-server')
makedepends=()
url=("http://bloodstar.net/2012/04/sxd")
source=($pkgname $pkgname-conf)
backup=(etc/conf.d/$pkgname)
md5sums=('93316bc4a41235f8b7445e3ba2132be6'
	'8dc04e2b6733a2e0b76af13ad1d80b49')
install='sxd.install'
build() {
  install -D $pkgname $pkgdir/etc/rc.d/$pkgname
  install -D -m644 $pkgname-conf $pkgdir/etc/conf.d/$pkgname
}
