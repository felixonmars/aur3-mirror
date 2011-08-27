# Contributor: Andrwe Lord Weber <lord-weber-andrwe at renona-studios dot org>

pkgname=quantz-demo
_tmpname="QuantZ"
pkgver=1.1.4
pkgrel=1
pkgdesc="A native linux non-ordinary puzzle game (Demo)"
arch=('i686' 'x86_64')
url="http://www.gamerizon.com/"
license=('unknown')
groups=""
depends=( 'libxdamage' 'mesa' 'xorg-utils' )
makedepends=()
optdepends=( 'nvidia-utils: if you use nvida graphic cards' )
provides=('quantz')
conflicts=('quantz')
replaces=()
backup=()
options=()
install=""
source=("http://c0550982.cdn.cloudfiles.rackspacecloud.com/${_tmpname}-demo_${pkgver}_i386.tar.gz" "quantz.desktop")
[ "$CARCH" == "x86_64" ] && source=("http://c0550982.cdn.cloudfiles.rackspacecloud.com/${_tmpname}-demo_${pkgver}_amd64.tar.gz" "quantz.desktop")
noextract=()
md5sums=('b90ac5cb04c4811d29cc97972ceac317'
         'c19172aa6efa8fbacbdf4e201ea609f2')
[ "$CARCH" == "x86_64" ] && md5sums=('d3a3daa0887ac4859fdfa2b7ca7234bd'
         'c19172aa6efa8fbacbdf4e201ea609f2')

build() {
	cd "${srcdir}"/${_tmpname}
	
	mkdir -p "${pkgdir}"/{lib,usr/share/{icons/${_tmpname},applications},usr/bin,usr/share/doc/${pkgname},}
	cp -r lib/ "${pkgdir}"/
	cp icons/* "${pkgdir}"/usr/share/icons/${_tmpname}/
	cp ${_tmpname} "${pkgdir}"/usr/bin/
	cp {${_tmpname}.manual,README,COPYING} "${pkgdir}"/usr/share/doc/${pkgname}/
	cp "${startdir}"/quantz.desktop "${pkgdir}"/usr/share/applications/
	sed -i "s/!ver!/${pkgver}-${pkgrel}/g" "${pkgdir}"/usr/share/applications/quantz.desktop
} 
