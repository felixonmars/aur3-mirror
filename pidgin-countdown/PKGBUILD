# Maintainer:  JokerBoy (www.punctweb.ro)

pkgname=pidgin-countdown
pkgver=0.3
pkgrel=1
pkgdesc="A plugin to countdown to a specific date and time."
arch=('i686' 'x86_64')
url="https://launchpad.net/pidgin-countdown"
license=('GPL2')
depends=('pidgin')
makedepends=('libtool') 
source=(http://launchpad.net/pidgin-countdown/trunk/$pkgver/+download/$pkgname.tar.bz2 correct-prefix.patch)
md5sums=('ea8a8006dc3fafc2991e2b6543215372' '29b729c252782d9fd9215e2ba0fc8418')

build() {
	cd $srcdir
	patch -p0 < $srcdir/correct-prefix.patch || return 1
	make || return 1
	make PREFIX=$pkgdir install || return 1
}