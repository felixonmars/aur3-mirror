# Contributor: Sapphira Armageddos <shadowkyogre@aim.com>
pkgname=mse-extrafoils-gold
pkgver=2.0.0
pkgrel=1
pkgdesc="Various extra foils from The Foil and Overlay Thread. This one is the ghost foil gradient ."
arch=('i686' 'x86_64')
url="http://mtg.pifro.com/viewtopic.php?f=19&t=704"
license=('GPL')
depends=('magicseteditor')

groups=('mse-addons' 'mse-addons-foils')
source=('magic-overlay-foil-gold.mse-installer::http://mtg.pifro.com/download/file.php?id=1659')
md5sums=(d3061eea17ca8318a9060672d76eb106)


PACKAGER="Sapphira Armageddos"

build() {
	cd $srcdir
	mkdir -p $pkgdir/usr/share/magicseteditor/data
	bsdtar -xf magic-overlay-foil-gold.mse-installer
	chmod -x ./*.mse-include/*
cp -r ./*.mse-include $pkgdir/usr/share/magicseteditor/data
}

# vim:set ts=2 sw=2 et:



