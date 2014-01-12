# Maintainer: Andrew DeMaria <lostonamountain AT gmail DOT com>
pkgname=pci-powersave
pkgver=1
pkgrel=1
pkgdesc="Provides a simple udev rule to turn on runtime power management for pci devices"
arch=('any')
url="https://github.com/muff1nman/pci-powersave"
license=('GPL3')
groups=('powersaver-udev-rules')
source=(
	'10-pci-power-management.rules'
	'LICENSE'
)
sha256sums=(
	'bcee878b110d0239fe3ad95f3412e12461219a88b0e9b9bc1fa810d73a22b101'
	'8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903'
)

package() {
	install -D -m644 10-pci-power-management.rules ${pkgdir}/etc/udev/rules.d/10-pci-power-management.rules
	install -D -m644 LICENSE ${pkgdir}/usr/share/licenses/pci-powersave/LICENSE
}
