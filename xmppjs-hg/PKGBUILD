# Packager: Emmanuel Gil Peyrot <linkmauve@linkmauve.fr>
pkgname=xmppjs-hg
pkgver=19
pkgrel=1
pkgdesc='xmpp.js is a server-side XMPP library for Node.js'
arch=('i686' 'x86_64')
provides=('xmppjs')
conflicts=('xmppjs')
url='http://xmppjs.prosody.im/'
license='MIT'
depends=('nodejs' 'node-xml')
makedepends=('mercurial')

_hgroot="http://code.matthewwild.co.uk/"
_hgrepo="xmppjs"

build() {
	cd $srcdir/$_hgrepo

	sed -i 's,"./node-xml/lib/node-xml","node-xml",; s,"./sha1","sha1",' xmpp.js
	mkdir -p $pkgdir/usr/lib/node/
	install -Dm0644 *.js $pkgdir/usr/lib/node/

	sed -i 's,"../xmpp","xmpp",' examples/*
	mkdir -p $pkgdir/usr/share/$_hgrepo/examples/
	install -Dm0644 examples/* $pkgdir/usr/share/$_hgrepo/examples/

	install -Dm0644 COPYING $pkgdir/usr/share/licenses/$_hgrepo/COPYING
	install -Dm0644 README.markdown $pkgdir/usr/share/$_hgrepo/README.markdown
}

