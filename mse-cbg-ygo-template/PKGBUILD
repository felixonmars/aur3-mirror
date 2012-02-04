# Contributor: Sapphira Armageddos <shadowkyogre@aim.com>
pkgname=mse-cbg-ygo-template
pkgver=2.0.0
pkgrel=2
pkgdesc="A more space-efficient and fancy template for the YuGiOh game."
arch=('any')
url="http://magicseteditor.sourceforge.net"
license=('GPL')
depends=('mse-ygo' 'ttf-lightfoot')
conflicts=('mse-cbg-ygo-template-xyz')
source=("yugioh-cbg.mse-installer::http://mtg.pifro.com/download/file.php?id=2481&sid=57d0b13af8cb7448a11b1b9c747b85c1")

md5sums=('1d87884992a14a05c5ba5e6f7b4a1811')

build() {
	mkdir -p $pkgdir/usr/share/magicseteditor/data
	bsdtar -xf yugioh-cbg.mse-installer
	chmod -x ./*.mse-style/*
	cp -r ./*.mse-style $pkgdir/usr/share/magicseteditor/data
	cp ./xyz-card.png $pkgdir/usr/share/magicseteditor/data/yugioh-cbg.mse-style
}

# vim:set ts=2 sw=2 et:
