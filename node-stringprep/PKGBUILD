# Packager: Sonny Piers <sonny.piers@gmail.com>

pkgname=node-stringprep
pkgver=0.0.5
pkgrel=1
pkgdesc='ICU StringPrep profiles'
arch=(i686 x86_64)
url="https://github.com/astro/node-stringprep"
license="MIT"
depends=('nodejs' 'icu')
source=('https://github.com/astro/node-stringprep/zipball/v0.0.5')
md5sums=('e6b4decaf1badcedb61acc829ecfc9a0')


build() {
	cd $srcdir/astro-node-stringprep-29fb032

	./install.sh

	mkdir -p $pkgdir/usr/lib/node/
	install -Dm0755 build/default/node-stringprep.node $pkgdir/usr/lib/node/

	mkdir -p $pkgdir/usr/share/node-stringprep/
	install -Dm0644 README.markdown $pkgdir/usr/share/node-stringprep/README.markdown
}
