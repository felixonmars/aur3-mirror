# Contributor: Gilles CHAUVIN <gcnweb at gmail dot com>
# Contributor: moostik <mooostik at gmail dot com>

pkgname=pysycache-lang-de
pkgver=3.1b
pkgrel=1
pkgdesc="German language pack for PySyCache"
arch=('any')
url="http://www.pysycache.org/"
license=("GPL")
depends=('pysycache')
source=(http://download.tuxfamily.org/py4childs/themes/themes-move/pack-lang-gpl-de-${pkgver}.zip)
md5sums=('2bde9b98b2df6e50b4a7e800626fb1b6')

build() {
	mkdir -p $startdir/pkg/usr/share/pysycache/themes-move
	cp -R $startdir/src/themes-move/* $startdir/pkg/usr/share/pysycache/themes-move
	chgrp -R pysycache $startdir/pkg/usr/share/pysycache
}
