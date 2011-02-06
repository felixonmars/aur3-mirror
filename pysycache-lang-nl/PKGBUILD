# Contributor: Gilles CHAUVIN <gcnweb at gmail dot com>
# Contributor: moostik <mooostik at gmail dot com>

pkgname=pysycache-lang-nl
pkgver=3.1b
pkgrel=1
pkgdesc="Dutch language pack for PySyCache"
arch=('any')
url="http://www.pysycache.org/"
license=("GPL")
depends=('pysycache')
source=(http://download.tuxfamily.org/py4childs/themes/themes-move/pack-lang-gpl-nl-${pkgver}.zip)
md5sums=('ee76c6922ddc8bb580d0e643a7fa482d')

build() {
	mkdir -p $startdir/pkg/usr/share/pysycache/themes-move
	cp -R $startdir/src/themes-move/* $startdir/pkg/usr/share/pysycache/themes-move
	chgrp -R pysycache $startdir/pkg/usr/share/pysycache
}
