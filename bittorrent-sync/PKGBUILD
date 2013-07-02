# Maintainer: Dalton Miller
# Contributor: Kilian Lackhove kilian@lackhove.de
pkgname=bittorrent-sync
pkgver=1.1.26
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
	sha256sums+=('516037d00afa37871df0ab19bcdc11142855f9400835760d3765d5d2d6cb7246')
elif [ "$CARCH" == i686 ]; then
	source+=("http://syncapp.bittorrent.com/$pkgver/btsync_i386-$pkgver.tar.gz")
        sha256sums+=('20416b8e14621c99d153c4fe515414a96082ed4cafabf259fc25e28a97d0db55')
elif [ "$CARCH" == arm ] || [ "$CARCH" == armv6h ]; then
        source+=("http://syncapp.bittorrent.com/$pkgver/btsync_arm-$pkgver.tar.gz")
        sha256sums+=('b1499041ee9b946a50f70d749ac0d2a3d660992c4a99aa5754c923badd8288e4')
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
