# Maintainer: ShadowKyogre <shadowkyogre@aim.com>
pkgname=mse-transform-magic-template
pkgver=2.0.0
pkgrel=2
pkgdesc="Template for the newly release transformable cards"
arch=('any')
url="http://mtg.pifro.com/viewtopic.php?f=26&t=1455"
license=('GPL')
depends=('mse-mtg')

source=("magic-transform.mse-installer::http://mtg.pifro.com/download/file.php?id=2871")
md5sums=('5c7c4de5ee5a7c61eec6c5b76159e755')

build() {
	cd $srcdir
	mkdir -p $pkgdir/usr/share/magicseteditor/data
	bsdtar -xf magic-transform.mse-installer
	chmod -x ./*.mse-style/*
	cp -r ./*.mse-style $pkgdir/usr/share/magicseteditor/data
}

# vim:set ts=2 sw=2 et:
