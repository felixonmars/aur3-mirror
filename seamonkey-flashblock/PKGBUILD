# Maintainer: Evgenij Vdovin <evdovin@pochta.ru>

pkgname=seamonkey-flashblock
pkgver=1.5.15.1
pkgrel=1
pkgdesc="Flashblock for SeaMonkey"
_realpkgname=${pkgname##seamonkey-}
_seamonkeyver=`seamonkey -V |sed -r 's/.*([0-9]+\.[0-9.]\.[0-9]+)/\1/'`

arch=('any')
license=('MPL')
url="https://addons.mozilla.org/en-US/seamonkey/addon/flashblock"
depends=("seamonkey>=2.0a")
makedepends=('unzip' 'zip')
source=(
	https://addons.mozilla.org/seamonkey/downloads/file/126475/${_realpkgname}-${pkgver}-fx.xpi
	seamonkey.patch
)
sha256sums=(
	'cced10f6b3f5de99ebf7d5636a0802c6794ab594b54190062a6291655e118311'
	'77560058f0f1fdca693e340188159f7e0ff57cb6e755d7a0259751679286a481'
)
noextract=(${_realpkgname}-${pkgver}-fx.xpi)

package(){
	unzip -o ${_realpkgname}-${pkgver}-fx.xpi install.rdf
	_emid=`cat install.rdf |awk -F'<em:id>|</em:id>' '/<em:id>/ {print $2; exit}'`
	patch install.rdf -i seamonkey.patch
	install -Dm644 ${_realpkgname}-${pkgver}-fx.xpi ${pkgdir}/usr/lib/seamonkey-${_seamonkeyver}/extensions/${_emid}.xpi
	zip ${pkgdir}/usr/lib/seamonkey-${_seamonkeyver}/extensions/${_emid}.xpi install.rdf
}
