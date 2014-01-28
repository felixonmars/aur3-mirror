# Maintainer: Thermionix <thermionix@gmail>
pkgname='xbmc-addon-steam-launcher'
pkgver=20140127
pkgrel=4
pkgdesc='XBMC addon to launch Steam from within XBMC.'
arch=('any')
url='http://xbmc.org/'
license=('MIT')
depends=('xbmc' 'steam' 'steam-standalone' 'sudo')
source=("steam-switcher.service"
		"steam-launcher.sudoers"
		"addon.xml"
		"default.py"
		"fanart.jpg"
		"icon.png")
sha256sums=('7e1f7bb879fb8a75efca07bfb8c5531259d475925401a14edbcb42bb12689478'
			'95ce2bd514376d956e3650d0181f86ccae1c85476bad75f875d1c73b6851ebd7'
			'a4ef6f68aaadc59eca6f385821266a3146469f4671d5ef802b7b78f62a30335b'
			'c11f9dfc1870619495949140d1f2522724f12d43fd37f1e396cbd48cb2202de2'
			'6490836b5feecbddf7057aa77c9c2775966a0eabcd85946c5e99b169d615c80c'
			'9bd0072d1d2bf9b78fad654cf0f1dba7948383a67a4ec70d4b0ae63d1d64efdf')

package() {
	install -Dm440 "$srcdir/steam-launcher.sudoers" "$pkgdir/etc/sudoers.d/30-steam-launcher"
	chmod 750 "$pkgdir/etc/sudoers.d"
	install -Dm644 "$srcdir/addon.xml" "$pkgdir/usr/share/xbmc/addons/script.steam.launcher/addon.xml"
	install -Dm644 "$srcdir/default.py" "$pkgdir/usr/share/xbmc/addons/script.steam.launcher/default.py"
	install -Dm644 "$srcdir/fanart.jpg" "$pkgdir/usr/share/xbmc/addons/script.steam.launcher/fanart.jpg"
	install -Dm644 "$srcdir/icon.png" "$pkgdir/usr/share/xbmc/addons/script.steam.launcher/icon.png"
	install -Dm644 "$srcdir/steam-switcher.service" "${pkgdir}/usr/lib/systemd/system/steam-switcher.service"
}

