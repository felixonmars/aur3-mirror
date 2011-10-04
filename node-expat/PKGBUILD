# Packager: Sonny Piers <sonny@fastmail.net>

pkgname=node-expat
pkgver=1.4.0
pkgrel=2
pkgdesc='NodeJS binding for fast XML parsing.'
arch=(i686 x86_64)
url="http://github.com/astro/node-expat"
license="MIT"
depends=("nodejs")
source=(https://github.com/astro/node-expat/tarball/v${pkgver}
				node-expat.patch)
md5sums=('81b84d4026344406896907f3a44e6fed'
				 '149235c19f29732faacdaf53da7ba4a6')

build() {
	cd $srcdir/astro-node-expat-0833c14
	
	patch lib/node-expat.js ../node-expat.patch

	node-waf configure
	node-waf build
}
package() {
	cd $srcdir/astro-node-expat-0833c14
	
	mkdir -p $pkgdir/usr/lib/node/node-expat/
	install -Dm0755 build/default/$pkgname.node $pkgdir/usr/lib/node/node-expat/
	install -Dm0755 lib/$pkgname.js $pkgdir/usr/lib/node/node-expat/index.js
	
	mkdir -p $pkgdir/usr/share/$pkgname/
	install -Dm0644 README.markdown $pkgdir/usr/share/$pkgname/README.markdown
}
