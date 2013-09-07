# Maintainer: Benoît Giraudou <bgiraudou@gmail.com>
pkgname=epub-thumbnailer
pkgver=1.0
pkgrel=1
pkgdesc="Creates thumbnail for EPUB files."
arch=('x86_64')
url="https://github.com/marianosimone/epub-thumbnailer"
license=('GPL3')
depends=('python2' 'python2-imaging')
makedepends=('git')
source=('git://github.com/marianosimone/epub-thumbnailer.git')
md5sums=('SKIP')

build() {
	cd "$pkgname"
	sed -i 's|#!/usr/bin/python|#!/usr/bin/env python2|' epub-thumbnailer
}

package() {
  	cd "$pkgname"
  	install -dm755 ${pkgdir}/usr/bin/
  	install -m755 epub-thumbnailer ${pkgdir}/usr/bin/
  	install -dm755 ${pkgdir}/usr/share/thumbnailers/
  	install -m644 epub.thumbnailer ${pkgdir}/usr/share/thumbnailers/
}