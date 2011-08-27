# Contributor: Gilles CHAUVIN <gcnweb at gmail dot com>
# Contributor: moostik <mooostik at gmail dot com>

pkgname=pysycache-art
pkgver=3.1b
pkgrel=1
pkgdesc="Additionnal art for PySyCache puzzle activity"
arch=('any')
url="http://www.pysycache.org/"
license=("GPL")
depends=('pysycache')
options=('docs')
source=(http://download.tuxfamily.org/py4childs/themes/themes-puzzle/art-gpl-${pkgver}.zip)
md5sums=('293c9643300627fed1dcaa6b34e249b4')

build() {
	mkdir -p $startdir/pkg/usr/share/pysycache/themes-move
	cp -R $startdir/src/themes-puzzle/* $startdir/pkg/usr/share/pysycache/themes-puzzle
	chgrp -R pysycache $startdir/pkg/usr/share/pysycache
}
