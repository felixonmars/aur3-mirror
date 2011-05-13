# Contributor: Changaco <changaco ατ changaco δοτ net>

pkgname=tagtheora
pkgver=0.2.1
pkgrel=2
pkgdesc="A simple python script to change the tags of a Theora video file"
arch=('any')
url="http://open-source.ecchi.ca/?voir=projets/tagtheora"
license=('GPL')
depends=('python2' 'mutagen')
source=('http://open-source.ecchi.ca/source/tagtheora0.2.1.tar.gz')
md5sums=('b639ef3cc1bc38d4f27ffc2ceff11eaf')

build() {
	sed -i 's|^#! */usr/bin/env python|#!/usr/bin/env python2|' "$srcdir/$pkgname/tagtheora.py"
}

package() {
	mkdir -p "${pkgdir}/usr/bin"
	install -m 755 -T "$srcdir/$pkgname/tagtheora.py" "${pkgdir}/usr/bin/tagtheora"
}
