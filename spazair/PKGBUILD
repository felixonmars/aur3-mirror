# Contributor: Lorenzo Nizzi Grifi Gargiolli <lorenzo.nizzi.grifi[at]gmail.com>

pkgname=spazair
realname=SpazAIR
pkgver=0.8.3
pkgrel=1
pkgdesc="Twitter Client powered by Adobe AIR"
arch=('i686' 'x86_64')
url="http://funkatron.com/spaz"
license=('custom')
depends=('adobe-air')
options=(!emptydirs)
source=(http://funkatron.com/apps/spaz/AIR/${realname}-${pkgver}.air)
md5sums=('43642394304c9111e79022f3db58598f ')

build() {
	# Source
	cd ${startdir}/src/

	# Install
	install -D -m 644 ${realname}-${pkgver}.air ${startdir}/pkg/usr/share/spazair/${realname}-${pkgver}.air || return 1

	# Extra
	cd ${startdir}/extra/

	# Binaries
	install -D -m 755 ${pkgname} ${startdir}/pkg/usr/bin/${pkgname}

	# Desktop
	install -D ${pkgname}-desktop.desktop ${startdir}/pkg/usr/share/applications/${pkgname}-desktop.desktop
	install -D ${pkgname}.png ${startdir}/pkg/usr/share/pixmaps/${pkgname}.png
}
