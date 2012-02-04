# Maintainer: ShadowKyogre <shadowkyogre@aim.com>
pkgname=mse-cbg-planechase-template
pkgver=2.0.0
pkgrel=2
pkgdesc="A CBG style plane for Magic: the Gathering plane cards"
arch=('any')
url="http://magicseteditor.sourceforge.net/additional-templates"
license=('GPL')
depends=('magicseteditor')

source=("planechase-cbg.mse-installer::http://mtg.pifro.com/download/file.php?id=2192&sid=464e2430d4602a0d36062f206b3e3a5e")
md5sums=('6e76849c1836679e6580031caa1ec982')

build() {
	cd $srcdir
	mkdir -p $pkgdir/usr/share/magicseteditor/data
	bsdtar -xf planechase-cbg.mse-installer
	chmod -x ./*.mse-style/*
	cp -r ./*.mse-style $pkgdir/usr/share/magicseteditor/data
}

# vim:set ts=2 sw=2 et: