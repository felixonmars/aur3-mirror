# Contributor: Gilles CHAUVIN <gcnweb at gmail dot com>
# Contributor: moostik <mooostik at gmail dot com>

pkgname=pysycache-lang-en
pkgver=3.1b
pkgrel=2
pkgdesc="English language pack for PySyCache"
arch=('any')
url="http://www.pysycache.org/"
license=("GPL")
depends=('pysycache')
options=('docs')
source=(http://download.tuxfamily.org/py4childs/themes/themes-move/pack-lang-gpl-en-${pkgver}.zip)
md5sums=('2c6393ac41d463ab7e7ed1bb21237cbd')

build() {
	mkdir -p $startdir/pkg/usr/share/pysycache/themes-move
	cp -R $startdir/src/themes-move/* $startdir/pkg/usr/share/pysycache/themes-move
	chgrp -R pysycache $startdir/pkg/usr/share/pysycache
}
