# Maintainer: 7kry <kt@7kry.net>
pkgname=ttf-madokarunes
pkgdesc='Runes fonts (Archaic/Modern/Musical) from "Puella Magi Madoka Magica".'
pkgver=2.0
pkgrel=1
arch=(any)
url="http://wiki.puella-magi.net/Deciphering_the_runes"
license=('custom')
_archaic=maqbsm.ttf
_musical=hkvvvn.ttf
source=("http://a.pomf.se/${_archaic}"
        "http://a.pomf.se/${_musical}")
md5sums=('a34bd82eaf6250c042b824eb33b38e2e'
         '743bc26c29f6d495ee534c816cade05a')

prepare() {
	cd ${srcdir}
	mv ${_archaic} MadokaRunes.ttf
	mv ${_musical} MadokaMusical.ttf
}

package() {
	cd $srcdir
	install -d ${pkgdir}/usr/share/fonts/TTF
	install -m644 * ${pkgdir}/usr/share/fonts/TTF
}
