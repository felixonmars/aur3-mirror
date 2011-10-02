# Packager: Emmanuel Gil Peyrot <linkmauve@linkmauve.fr>
# Packager: Sonny Piers <sonny@fastmail.net>

pkgname=node-xmpp
pkgver=0.2.11
pkgrel=1
pkgdesc='Idiomatic XMPP client, component & server library for node.js'
arch=(i686 x86_64)
url="http://github.com/astro/node-xmpp"
license="GPLv3"
depends=("nodejs>=0.4.0" "node-expat>=1.2.0" "ltx>=0.0.4")
optdepends=('node-stringprep: for icu-based string normalization.')
source=("https://github.com/astro/node-xmpp/tarball/v${pkgver}")
md5sums=('8f9e2dcbebb5b624fd0e788ef42dc0f3')

build() {
	cd $srcdir/astro-node-xmpp-8fd7f4d

	mkdir -p $pkgdir/usr/lib/node/$pkgname
	cp -r lib/* $pkgdir/usr/lib/node/$pkgname

	echo "#!/usr/bin/env node
	module.exports = require('./node-xmpp/xmpp');" > $pkgdir/usr/lib/node/node-xmpp.js

	sed -i "s,\.\./lib/,," examples/*.js
	mkdir -p $pkgdir/usr/share/$pkgname/examples/
	cp -r examples/* $pkgdir/usr/share/$pkgname/examples/

	mkdir -p $pkgdir/usr/share/$pkgname/
	install -Dm0644 README.markdown $pkgdir/usr/share/$pkgname/README.markdown
}
