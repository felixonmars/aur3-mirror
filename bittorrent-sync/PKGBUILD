# Maintainer: Justin Patera serialhex@gmail.com
# Contrib Repo: https://github.com/serialhex/bittorrent-sync
#
# Contributor: Dalton Miller
# Contributor: Kilian Lackhove kilian@lackhove.de
pkgname=bittorrent-sync
pkgver=1.1.27
pkgrel=1
epoch=1
pkgdesc="BitTorrent Sync"
arch=('i686' 'x86_64' 'arm' 'armv6h')
url="http://labs.bittorrent.com/experiments/sync.html"
license=('custom')
backup=("etc/btsync.conf")
install="${pkgname}.install"
source=("bittorrent-sync.install"
	"btsync.service")
sha256sums=('b2240a8356c24356ca83bc2f9dcf759ceaa7dcdbbec45f5cc8cd0928b8f89df5'
	    '3ccf1a7e3f066bf4453035cbb5b4956b6d69d6abd4c41f34ed36b84f345ae90f')

if [ "$CARCH" == x86_64 ]; then
	source+=("http://syncapp.bittorrent.com/$pkgver/btsync_x64-$pkgver.tar.gz")
	sha256sums+=('96c1146bde1b291889271e233629ee886fe1cc594deab6ea4baea01903148083')
elif [ "$CARCH" == i686 ]; then
	source+=("http://syncapp.bittorrent.com/$pkgver/btsync_i386-$pkgver.tar.gz")
        sha256sums+=('228db92c89449f91c7c6270d88e6c182285a3b6ceba5e9bff4064c1417c371e9')
elif [ "$CARCH" == arm ] || [ "$CARCH" == armv6h ]; then
        source+=("http://syncapp.bittorrent.com/$pkgver/btsync_arm-$pkgver.tar.gz")
        sha256sums+=('5f422210b03f097e9e30803568388f84c95d2556bddb3ad3ae8f84a707aee857')
fi

build() {
	cd "${srcdir}"
	./btsync --dump-sample-config > btsync.conf
}

package() {
	cd "${srcdir}"

	./btsync --dump-sample-config | sed 's:/home/user/\.sync:/var/lib/btsync:g' > btsync.conf
	install -D -m 644 btsync.conf "${pkgdir}/etc/btsync.conf"

	install -D -m 755 btsync "${pkgdir}/usr/bin/btsync"

	install -D -m 644 btsync.service "${pkgdir}/usr/lib/systemd/system/btsync.service"

	install -D -m 644 LICENSE.TXT "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.TXT"
}
