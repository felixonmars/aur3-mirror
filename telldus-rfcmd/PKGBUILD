# Contributor: Peter Hultqvist <endnode dot se>
pkgname=telldus-rfcmd
pkgver=2.0.3
pkgrel=1
pkgdesc="TellStick transmitter"
arch=('i686' 'x86_64')
url="http://developer.telldus.se/wiki/TellStickInstallationSource"
license=('GPL2')
depends=()
makedepends=('gcc' 'make')
backup=('etc/tellstick.conf')
source=(
	http://download.telldus.se/TellStick/Software/telldus-core/telldus-core-$pkgver.tar.gz
	10-tellstick.rules
)
md5sums=('6aca1a23481f11ab5e67418efce94310'
         '19535e01fc1df605e09a975b0f328764')

build()
{
	cd $srcdir/telldus-core-$pkgver/rfcmd/
	gcc rfcmd.c -lrt -o rfcmd
	install -D -m0755 rfcmd $pkgdir/usr/bin/rfcmd || return 1
	install -D -m0644 $srcdir/10-tellstick.rules $pkgdir/etc/udev/rules.d/10-tellstick.rules || return 1
}
