# Maintainer: Iuri Rezende Souza <riuri@rocketmail.com>
pkgname=heron
pkgver=1.0
pkgrel=2
pkgdesc="A tool for reading UDC Summary"
arch=('i686' 'x86_64')
url="https://github.com/riuri/heron"
license='CCPL'
depends=('libxml2')
makedepends=('make' 'gcc')
source=('heron::git://github.com/riuri/heron.git#branch=master'
	'http://udcdata.info/udcsummary-skos.zip')
md5sums=('SKIP'
         '166d062e078e9eeda7670c817df1e4b8')

build() {
	cd "${srcdir}/heron"
	mv heron.c heron.c.in
	sed 's:"udcsummary-skos.rdf":"/usr/share/heron/udcsummary-skos.rdf":' <heron.c.in >heron.c
	make heron
}

package() {
	mkdir -p "${pkgdir}/usr/bin"
	mkdir -p "${pkgdir}/usr/share/heron"
	
	install -Dm755 "${srcdir}/heron/heron" "${pkgdir}/usr/bin/heron"
	install -Dm644 "${srcdir}/udcsummary-skos.rdf" "${pkgdir}/usr/share/heron/"
}
