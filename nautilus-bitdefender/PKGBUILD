# Maintainer: Wayne Hartmann <teodh4@gmail.com>
# Contributor: arriagga <ramon.arriaga@gmail.com>
# Contributor: The BitDefender Team <unices@bitdefender.com>

pkgname=nautilus-bitdefender
pkgver=1.0.0
pkgrel=2
pkgdesc="BitDefender Antivirus Scanner for Unices extension for Nautilus"
arch=('i686' 'x86_64')
depends=('bitdefender' 'nautilus>=3.0')
provides=()
license=(GPL)
url="http://unices.bitdefender.com/"
source=(http://unices.bitdefender.com/wp-content/uploads/2009/06/ubuntu-10.04-nautilus-bitdefender_100-1_i386.deb)
md5sums=('132c4ab1a52f7bb10b746010046ff611')
[ "$CARCH" = "x86_64" ] && source=(http://unices.bitdefender.com/wp-content/uploads/2009/06/ubuntu-10.04-nautilus-bitdefender_100-1_amd64.deb)
[ "$CARCH" = "x86_64" ] && md5sums=('16d7f02df4147aceeef60b02d628b94b')

build() {
	cd $srcdir

	if ["$CARCH" == "x86_64"]
	then
		ar p ubuntu-10.04-nautilus-bitdefender_100-1_amd64.deb data.tar.gz | tar zx
	else
		ar p ubuntu-10.04-nautilus-bitdefender_100-1_i386.deb data.tar.gz | tar zx
	fi

	mkdir -p $pkgdir/usr/share/icons/hicolor
	cp -R $srcdir/usr/share/icons/hicolor $pkgdir/usr/share/icons/
	chmod -R 755 /usr/share/icons/hicolor/   
	install -Dm644 $srcdir/usr/lib/nautilus/extensions-2.0/libnautilus-bitdefender.so $pkgdir/usr/lib/nautilus/extensions-3.0/libnautilus-bitdefender.so
}
