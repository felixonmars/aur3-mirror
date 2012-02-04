# Contributor: Gilles CHAUVIN <gcnweb at gmail dot com>
# Contributor: moostik <mooostik at gmail dot com>

pkgname=pysycache-lang-da
pkgver=3.1b
pkgrel=1
pkgdesc="Dannish language pack for PySyCache"
arch=('any')
url="http://www.pysycache.org/"
license=("GPL")
depends=('pysycache')
source=(http://download.tuxfamily.org/py4childs/themes/themes-move/pack-lang-gpl-da-${pkgver}.zip)
md5sums=('278a038a5055bce44554cbcabdbb792a')

build() {
        mkdir -p $startdir/pkg/usr/share/pysycache/themes-move
        cp -R $startdir/src/themes-move/* $startdir/pkg/usr/share/pysycache/themes-move
        chgrp -R pysycache $startdir/pkg/usr/share/pysycache
}
