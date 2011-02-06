# Contributor: Dominion <xGenoBlast@gmail.com>

pkgname=bview
pkgver=0.02
pkgrel=1
pkgdesc='A minimalist sprite viewer'
arch=('i686' 'x86_64')
url="http://byuu.org/"
license=('custom:public-domain')
depends=('libxtst' 'gtk2')
source=('http://byuu.org/files/bview_v02.zip' 'fix-includes.patch'
	'no-clear.patch')
md5sums=('5cc9e09723cda3d7a51030af23941925' 'da9cd3120fe2a974f5214aeee8e88de5'
	'00ca9f4e378a1fee303197655fa3d8ad')

build() {
	cd bview
	patch bview.h "${srcdir}/fix-includes.patch"
	patch cc.sh "${srcdir}/no-clear.patch"

	./cc.sh
	install -Dm755 bview "${pkgdir}/usr/bin/bview"

	mkdir -p "${pkgdir}/usr/share/licenses/$pkgname"
	echo 'This software is in the public domain.' \
		> "${pkgdir}/usr/share/licenses/$pkgname/LICENSE"

}
