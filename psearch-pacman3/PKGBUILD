# Contributor: Justin Cameron <wrythe@gmail.com>
# Maintainer: Tim Zebulla <amon at faumrahrer.de>

pkgname=psearch-pacman3
pkgver=1.1
_pkgver="${pkgver}-7"
pkgrel=3
pkgdesc="Python module with accompanying script to access pacman database information. Includes AUR support. Fixed for working with pacman 3 DB schema"
arch=(i686 x86_64)
url=('http://www.freshcheese.net/~wrythe/psearch')
license="GPL"
depends=('python')
source=(http://www.freshcheese.net/~wrythe/psearch/source/psearch-${_pkgver}.tar.gz)
md5sums=('f5e8d6c68cdfe59373faae9b280ab819')
conflicts=('psearch')
provides=('psearch')
install="${pkgname}.install"

build() {
 cd $startdir/src/psearch-$_pkgver

 sed -e "s|/var/lib/pacman/|/var/lib/pacman/sync/|g" -i psearch.py
 python setup.py install --root=$startdir/pkg/

 install -D -m755 psearch $startdir/pkg/usr/bin/psearch
 install -D -m644 psearch.1 $startdir/pkg/usr/man/man1/psearch.1
}

