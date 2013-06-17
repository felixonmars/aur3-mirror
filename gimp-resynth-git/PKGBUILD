# Maintainer: Lex Black (autumn-wind at web.de)
# Contributor: andre.vmatos

_pkgname=resynthesizer
pkgname=gimp-resynth-git
pkgver=2.0.4.g23dced0
pkgrel=2
pkgdesc="Suite of gimp plugins for texture synthesis. Git-Version"
arch=('any')
url="https://github.com/bootchk/resynthesizer"
license=('GPL2')
depends=('gimp')
makedepends=('git' 'intltool')
conflicts=('gimp-resynth')
provides=('gimp-resynth' 'gimp-plugin-resynthesizer')
options=('!emptydirs')
source=('git://github.com/bootchk/resynthesizer#branch=master')
md5sums=('SKIP')


pkgver() {
	cd $_pkgname
	git describe | sed -e 's|-|.|g' -e 's|v||'
}

build() {
	cd "$srcdir/${_pkgname}"

	./configure --disable-maintainer-mode --prefix=/usr
	make
}

package() {
	cd "${srcdir}/${_pkgname}"
	
	make DESTDIR="$pkgdir/" install
	sed -i 's|/usr/bin/env python|/usr/bin/env python2|' "$pkgdir"/usr/lib/gimp/2.0/plug-ins/*.py
}
