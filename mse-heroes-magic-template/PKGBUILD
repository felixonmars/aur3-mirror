# Maintainer: ShadowKyogre <shadowkyogre@aim.com>
pkgname=mse-heroes-magic-template
pkgver=2.0.0
pkgrel=2
pkgdesc="Adds a new Magic: the Gathering card type: Hero"
arch=('any')
url="http://magicseteditor.sourceforge.net/node/1319"
license=('GPL')
depends=('mse-mtg')

source=("magic-heroes.mse-installer::http://mtg.pifro.com/download/file.php?id=1713")
md5sums=('3381a63f19b9e381f42a4c2f6c15ee39')

build() {
	cd $srcdir
	mkdir -p $pkgdir/usr/share/magicseteditor/data
	bsdtar -xfmagic-heroes.mse-installer
	cp -r ./*.mse-style $pkgdir/usr/share/magicseteditor/data
}

# vim:set ts=2 sw=2 et: