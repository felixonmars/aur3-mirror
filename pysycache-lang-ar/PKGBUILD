# Contributor: Gilles CHAUVIN <gcnweb at gmail dot com>
# Contributor: moostik <mooostik at gmail dot com>

pkgname=pysycache-lang-ar
pkgver=3.1c
pkgrel=1
pkgdesc="Arabic language pack for PySyCache"
arch=('any')
url="http://www.pysycache.org/"
license=("GPL")
depends=('pysycache')
source=(http://download.tuxfamily.org/py4childs/themes/themes-move/pack-lang-gpl-ar-${pkgver}.zip)

build() {
	mkdir -p $startdir/pkg/usr/share/pysycache/themes-move
	cp -R $startdir/src/themes-move/* $startdir/pkg/usr/share/pysycache/themes-move
	chgrp -R pysycache $startdir/pkg/usr/share/pysycache
}
md5sums=('38eac0834731fca6844f2ced7decdc9e')
