# Maintainer: Andrew DeMaria <lostonamountain AT gmail DOT com>
pkgname=wlan-powersave
pkgver=1
pkgrel=1
pkgdesc="Provides a simple udev rule to turn on power saving for wlan* adapters"
arch=('any')
url="https://github.com/muff1nman/wifi-powersave"
license=('GPL3')
groups=('powersaver-udev-rules')
source=(
	'70-wifi-powersave.rules'
	'LICENSE'
)
sha256sums=(
	'483eb9e48473a4f30093a6728c2c8316b3b4eed962dbe93af3deb0c7f9ba1d1c'
	'8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903'
)

package() {
	install -D -m644 70-wifi-powersave.rules ${pkgdir}/etc/udev/rules.d/70-wifi-powersave.rules
	install -D -m644 LICENSE ${pkgdir}/usr/share/licenses/wlan-powersave/LICENSE
}
