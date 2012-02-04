# Packager: Emmanuel Gil Peyrot <linkmauve@linkmauve.fr>
# Packager: Sonny Piers <sonny@fastmail.net>

pkgname=ltx
pkgver=0.0.5
pkgrel=1
pkgdesc='<xml for="node.js">'
arch=(i686 x86_64)
url="http://github.com/astro/ltx"
license="GPLv3"
depends=("nodejs" "node-expat>=1.2.0")
source=("https://github.com/astro/ltx/zipball/v0.0.5")
md5sums=('6eea6d51808c73f830948a32aecc44cf')

build() {
	cd $srcdir/astro-ltx-2374b30

	mkdir -p $pkgdir/usr/lib/node/$pkgname
	install -Dm0644 lib/*.js $pkgdir/usr/lib/node/$pkgname

	mkdir -p $pkgdir/usr/share/$pkgname/
	install -Dm0644 README.markdown $pkgdir/usr/share/$pkgname/README.markdown
}
