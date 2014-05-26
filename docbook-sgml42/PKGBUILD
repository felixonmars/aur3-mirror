pkgname=docbook-sgml42
pkgver=4.2
pkgrel=1
pkgdesc='Document type definitions for verification of SGML data files against the DocBook rule set.'
arch=('any')
url='http://www.docbook.org/sgml/'
license=('custom')
depends=('sgml-common')
makedepends=('unzip')
install='docbook-sgml.install'
source=("http://www.docbook.org/sgml/${pkgver}/docbook-${pkgver}.zip")
sha256sums=('67ebd2c94b342718c6865d2de60f5d4ff02d77a7e4b0d9e72a48c45f2b2635c3')

build() {
	cd "$srcdir"

	local DTDDIR="usr/share/sgml/docbook-sgml-$pkgver"

	sed -i \
		-e '/ISO 8879/d' \
		-e '/gml/d' \
		docbook.cat

	# Add support for previous versions.
	cat >> docbook.cat << "EOF"

  -- Begin Single Major Version catalog changes --

PUBLIC "-//OASIS//DTD DocBook 4.1//EN" "docbook.dtd"
PUBLIC "-//OASIS//DTD DocBook 4.0//EN" "docbook.dtd"

  -- End Single Major Version catalog changes --

EOF
}

package() {
	cd "$srcdir"

	local DTDDIR="usr/share/sgml/docbook-sgml-$pkgver"

	install -dm755 "$pkgdir/$DTDDIR"
	install -m644 docbook.cat "$pkgdir/$DTDDIR/catalog"
	install -m644 *.dtd *.mod *.dcl "$pkgdir/$DTDDIR"
}

# vim:set syntax=sh ts=4 sw=4 noet:
