# Contributor: Sapphira Armageddos <shadowkyogre@aim.com>
pkgname=mse-vs
pkgver=2.0.0
pkgrel=6
pkgdesc="VS templates for Magic Set Editor."
arch=(any)
url="http://magicseteditor.sourceforge.net"
license=('freeware')
depends=('magicseteditor')
source=('http://downloads.sourceforge.net/magicseteditor/mse-linux32-2011-02-05-full.tar.gz')
md5sums=('5b8144c7ab1a2d4747907e7a4de87bf8')

build() {
	cd $srcdir
	mkdir -p $pkgdir/usr/share/magicseteditor/data
	cp -r ./magicseteditor/program/data/vs* $pkgdir/usr/share/magicseteditor/data
}

# vim:set ts=2 sw=2 et:
