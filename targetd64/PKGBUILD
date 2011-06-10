#Contributor: Markus M. May <mmay AT javafreedom DOT org>
pkgname=targetd64
pkgver=0.4.0
pkgrel=1
pkgdesc="an universal C64 archive related converter tool and emulator frontend"
url="http://home.arcor.de/karlheinz.langguth/targetd64/index.html"
arch=('i686' 'x86_64')
license=('GPL')
optdepends=('vice: 	A Versatile Commodore Emulator')
options=(!strip !docs )

source=(http://home.arcor.de/karlheinz.langguth/targetd64/targetd64-0.4.0.tgz)	

md5sums=('84c92be7b5ae5018d3f625bbc1b89718')

build() {
	cd ${srcdir}/${pkgname}-${pkgver}
	
	./configure --prefix=/usr --exec-prefix=${pkgdir}/usr
	make
}
	

package() {
	cd ${srcdir}/${pkgname}-${pkgver}
	
	make install
}
