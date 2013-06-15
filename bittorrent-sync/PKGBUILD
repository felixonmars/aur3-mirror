# Maintainer: Dalton Miller
# Contributor: Kilian Lackhove kilian@lackhove.de
pkgname=bittorrent-sync
pkgver=1.1.15
pkgrel=2
epoch=1
pkgdesc="BitTorrent Sync"
arch=('i686' 'x86_64' 'arm' 'armv6h')
url="http://labs.bittorrent.com/experiments/sync.html"
license=('custom')
backup=("etc/btsync.conf")
install="${pkgname}.install"
source=("bittorrent-sync.install"
	"btsync.service")
sha256sums=('76a24f21ffcf55c9e547ab0a0d2b6f2a8bbd73cb41318710957e1dab2bf177c4'
	    '3ccf1a7e3f066bf4453035cbb5b4956b6d69d6abd4c41f34ed36b84f345ae90f')

if [ "$CARCH" == x86_64 ]; then
	source+=("http://syncapp.bittorrent.com/$pkgver/btsync_x64-$pkgver.tar.gz")
	sha256sums+=('3224fc8584a5680510b2bf61dc02069e518b7298a2d0648a7ced1d01d4a8c92e')
elif [ "$CARCH" == i686 ]; then
	source+=("http://syncapp.bittorrent.com/$pkgver/btsync_i386-$pkgver.tar.gz")
        sha256sums+=('cdc07a40f43cb5220aa289c0ea1e1ecebe8f8b31335c3a1ad4cb435f41ad1484')
elif [ "$CARCH" == arm ] || [ "$CARCH" == armv6h ]; then
        source+=("http://syncapp.bittorrent.com/$pkgver/btsync_arm-$pkgver.tar.gz")
        sha256sums+=('a86d941d627a60d3424c5785fa8f1b74f458810c2101aab741db8330bcdf3391')
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
