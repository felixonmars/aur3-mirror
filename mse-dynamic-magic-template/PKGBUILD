# Maintainer: ShadowKyogre <shadowkyogre@aim.com>
pkgname=mse-dynamic-magic-template
pkgver=2.0.0
pkgrel=3
pkgdesc="CBG's dynamic style for Magic: the Gathering"
arch=('any')
url="http://mtg.pifro.com/viewtopic.php?f=19&t=1029"
license=('GPL')
depends=('mse-mtg')
source=("magic-dynamic.mse-installer::http://mtg.pifro.com/download/file.php?id=2092")
md5sums=('2b48301ab6ed615c464756ecc3811ca4')

build() {
	cd $srcdir
	mkdir -p $pkgdir/usr/share/magicseteditor/data
	bsdtar -xf magic-dynamic.mse-installer
	chmod -x ./*.mse-style/*
	cp -r ./*.mse-style $pkgdir/usr/share/magicseteditor/data
	cp -r ./*.mse-symbol-font $pkgdir/usr/share/magicseteditor/data
}

# vim:set ts=2 sw=2 et:
