# Contributor: Andrwe Lord Weber <lord-weber-andrwe at renona-studios dot org>

pkgname=quantz
_tmpname="QuantZ"
pkgver=game_1.1.4
pkgrel=2
pkgdesc="A native linux non-ordinary puzzle game"
arch=('i686' 'x86_64')
url="http://www.gamerizon.com/"
license=('unknown')
depends=( 'libxdamage' 'mesa' )
optdepends=( 'nvidia-utils: if you use nvida graphic cards' )
provides=('quantz')
conflicts=('quantz-demo')
source=("${_tmpname}-${pkgver}_i386.tar.gz" "quantz.desktop")
[ "$CARCH" == "x86_64" ] && source=("${_tmpname}-${pkgver}_amd64.tar.gz" "quantz.desktop")
md5sums=('812475f63fb22d1ef3bae662ca42c0a7'
         'b570b9f1e13e9cb9302e5dd0b1dc4700')
[ "$CARCH" == "x86_64" ] && md5sums=('9522650488d2c122a8a502afd827732c'
         'b570b9f1e13e9cb9302e5dd0b1dc4700')

build() {
	cd "${srcdir}"/${_tmpname}
	
	mkdir -p "${pkgdir}"/{lib,usr/share/{icons/${_tmpname},applications},usr/bin,usr/share/doc/${pkgname},}
	cp -r lib/ "${pkgdir}"/
	cp icons/* "${pkgdir}"/usr/share/icons/${_tmpname}/
	cp ${_tmpname} "${pkgdir}"/usr/bin/
	cp {${_tmpname}.manual,README,COPYING} "${pkgdir}"/usr/share/doc/${pkgname}/
	cp "${startdir}"/quantz.desktop "${pkgdir}"/usr/share/applications/
} 
