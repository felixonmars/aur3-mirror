# Maintainer: ShadowKyogre <shadowkyogre@aim.com>
pkgname=mse-nokiou-magic-template
pkgver=2.0.0
pkgrel=4
pkgdesc="An MSE version of Nokiou of MTG Salvation's custom style"
arch=('any')
url="http://mtg.pifro.com/viewtopic.php?f=19&t=737"
license=('GPL')
depends=('mse-mtg')
source=("magic-nokiou.mse-installer::http://mtg.pifro.com/download/file.php?id=1755")
md5sums=('942a14160502a178b93e85aa83e3aa12')

build() {
	cd $srcdir
	mkdir -p $pkgdir/usr/share/magicseteditor/data
	bsdtar -xf magic-nokiou.mse-installer
	chmod -x ./*.mse-s{tyle,ymbol-font}/*
	cp -r ./*.mse-s{tyle,ymbol-font} $pkgdir/usr/share/magicseteditor/data
}

# vim:set ts=2 sw=2 et: