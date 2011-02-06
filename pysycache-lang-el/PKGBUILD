# Contributor: Gilles CHAUVIN <gcnweb at gmail dot com>
# Contributor: moostik <mooostik at gmail dot com>

pkgname=pysycache-lang-el
pkgver=3.1b
pkgrel=1
pkgdesc="Greek language pack for PySyCache"
arch=('any')
url="http://www.pysycache.org/"
license=("GPL")
depends=('pysycache')
source=(http://download.tuxfamily.org/py4childs/themes/themes-move/pack-lang-gpl-el-${pkgver}.zip)

build() {
	mkdir -p $startdir/pkg/usr/share/pysycache/themes-move
	cp -R $startdir/src/themes-move/* $startdir/pkg/usr/share/pysycache/themes-move
	chgrp -R pysycache $startdir/pkg/usr/share/pysycache
}
md5sums=('a9c559404db22bddb2dbbefcded6d3ba')
