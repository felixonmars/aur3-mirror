# Maintainer: Evgenij Vdovin <evdovin@pochta.ru>

pkgname=seamonkey-seatabx-sm21
pkgver=1.1.3
pkgrel=1
pkgdesc="SeaTab X Adds a close button to each browser and mail tab."
_realpkgname=${pkgname##seamonkey-}
_seamonkeyver=`seamonkey -V |sed -r 's/.*([0-9]+\.[0-9.]\.[0-9]+)/\1/'`

arch=('any')
license=('MPL')
url="http://tom-cat.com/mozilla/seamonkey/extensions-seatabx.html"
depends=("seamonkey>=2.0a")
makedepends=('unzip' 'zip')
source=(http://tom-cat.com/mozilla/downloads/${_realpkgname}.xpi)
sha256sums=('7575b6ee9286135b0a01ddd76c9552f8ca86f0b2c9a2134bc88fff92bd2dfe4c')
noextract=(${_realpkgname}.xpi)

package(){
	_emid=`unzip -p ${_realpkgname}.xpi install.rdf |awk -F'em:id="|"' '/em:id="/ {print $2; exit}'`
	install -Dm644 ${_realpkgname}.xpi ${pkgdir}/usr/lib/seamonkey-${_seamonkeyver}/extensions/${_emid}.xpi
}
