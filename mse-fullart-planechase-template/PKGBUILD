# Maintainer: ShadowKyogre <shadowkyogre@aim.com>
pkgname=mse-fullart-planechase-template
pkgver=2.0.0
pkgrel=3
pkgdesc="A horizontal fullart plane style for Magic: the Gathering plane cards"
arch=('any')
url="http://magicseteditor.sourceforge.net/additional-templates"
license=('GPL')
depends=('mse-mtg')

source=("planechase-fullart-horizontal.mse-installer::http://mtg.pifro.com/download/file.php?id=2195&sid=464e2430d4602a0d36062f206b3e3a5e")
md5sums=('f2bd548e5a3f72903c5c408778f4f877')

build() {
	cd $srcdir
	mkdir -p $pkgdir/usr/share/magicseteditor/data
	bsdtar -xf planechase-fullart-horizontal.mse-installer
	chmod -x ./*.mse-style/*
	cp -r ./*.mse-style $pkgdir/usr/share/magicseteditor/data
}

# vim:set ts=2 sw=2 et: