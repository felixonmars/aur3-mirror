# eBay Desktop: Installer: Arch
# Contributor: Chris Giles <Chris.G.27 (at) Gmail.com>

pkgname=ebay-desktop
realname=eBayDesktop
pkgver=1_0_6_361
pkgrel=1
pkgdesc="An eBay GUI that's powered by Adobe AIR"
arch=('i686' 'x86_64')
url="http://desktop.ebay.com/"
license=('custom')
depends=('adobe-air')
optdepends=('kdeutils: for KWallet integration')
options=(!emptydirs)
source=(http://desktop.ebay.com/release/${realname}_${pkgver}.air)
md5sums=('717c171cb8fe842525c1c757c39dd095')

build() {
	# Source
	cd ${startdir}/src/

	# Install
	install -D -m 644 ${realname}_${pkgver}.air ${startdir}/pkg/usr/share/ebay-desktop/${realname}_${pkgver}.air || return 1

	# Extra
	cd ${startdir}/extra/

	# Binaries
	install -D -m 755 ${pkgname} ${startdir}/pkg/usr/bin/${pkgname}

	# Desktop
	install -D ${pkgname}.desktop ${startdir}/pkg/usr/share/applications/${pkgname}.desktop
	install -D ${pkgname}.png ${startdir}/pkg/usr/share/pixmaps/${pkgname}.png
}
