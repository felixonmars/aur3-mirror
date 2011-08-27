# Contributor: Gilles CHAUVIN <gcnweb at gmail dot com>
# Contributor: moostik <mooostik at gmail dot com>

pkgname=pysycache-lang-fr
pkgver=3.1b
pkgrel=3
pkgdesc="French language pack for PySyCache"
arch=('any')
url="http://www.pysycache.org/"
license=("GPL")
depends=('pysycache')
options=('docs')
source=(http://download.tuxfamily.org/py4childs/themes/themes-move/pack-lang-gpl-fr-${pkgver}.zip)
md5sums=('e9bae9aa9a8bd52cdc705e3f3e778a78')

build() {
	mkdir -p $startdir/pkg/usr/share/doc/pysycache
	mkdir -p $startdir/pkg/usr/share/pysycache/themes-move
	cp -R $startdir/src/doc/UserManual $startdir/pkg/usr/share/doc/pysycache/
	cp -R $startdir/src/themes-move/* $startdir/pkg/usr/share/pysycache/themes-move
	chgrp -R pysycache $startdir/pkg/usr/share/doc/pysycache
	chgrp -R pysycache $startdir/pkg/usr/share/pysycache
}
