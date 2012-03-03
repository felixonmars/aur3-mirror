# Maintainer: Evgenij Vdovin <evdovin@pochta.ru>

pkgname=seamonkey-jokulsarlon-download-manager
pkgver=0.4
pkgrel=1
pkgdesc="In-tab tabular download manager for SeaMonkey"
_realpkgname=`echo $pkgname |sed s/seamonkey-// |sed s/-/_/g`
_seamonkeyver=`seamonkey -V |sed -r 's/.*([0-9]+\.[0-9.]\.[0-9]+)/\1/'`

arch=('any')
license=('MPL')
url="https://addons.mozilla.org/ru/firefox/addon/download-manager"
depends=("seamonkey>=2.0a")
makedepends=('unzip' 'zip')
source=(http://releases.mozilla.org/pub/mozilla.org/addons/256189/${_realpkgname}-${pkgver}-sm+fx.xpi)
sha256sums=('21e34e7baabbacd6baa837ca636923b262d0400ed742c0c8f23ff94516f67ad1')
noextract=(${_realpkgname}-${pkgver}-sm+fx.xpi)

package(){
	_emid=`unzip -p ${_realpkgname}-${pkgver}-sm+fx.xpi install.rdf |awk -F'<em:id>|</em:id>' '/<em:id>/ {print $2; exit}'`
	install -Dm644 ${_realpkgname}-${pkgver}-sm+fx.xpi ${pkgdir}/usr/lib/seamonkey-${_seamonkeyver}/extensions/${_emid}.xpi
}
