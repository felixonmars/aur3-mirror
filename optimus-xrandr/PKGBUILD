# Maintainer: artoo <openrc4arch.site40.net>

pkgname=optimus-xrandr
pkgver=1.0
pkgrel=1
pkgdesc="Script for nvidia optimus calling xrandr."
arch=('any')
url="https://github.com/udeved"
license=('GPL')
depends=('nvidia>=334.21' 'xorg-xrandr>=1.4.1')
install=optimus.install
source=('optimus-xrandr')
sha256sums=('088379783096ab1cc8ceb727c9b063b569187d79c14cd185d2b0da782cb5f78f')

package() {
	install -Dm 644 "${srcdir}/optimus-xrandr" "${pkgdir}/usr/bin/optimus-xrandr"
}
