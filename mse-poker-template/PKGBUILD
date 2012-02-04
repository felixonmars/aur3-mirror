# Contributor: Sapphira Armageddos <shadowkyogre@aim.com>
pkgname=mse-poker-template
pkgver=2.0.0
pkgrel=1
pkgdesc="Poker card template for Magic Set Editor"
arch=('any')
url="http://magicseteditor.sourceforge.net"
license=('GPL')

depends=('magicseteditor')
source=("poker.mse-installer::http://mtg.pifro.com/download/file.php?id=2412&sid=c91b0e6fb4bcfca1b75d552e0fad5e1c")
md5sums=('b92827806c3d3206e5727d9cc51c4a82')

build() {
	mkdir -p $pkgdir/usr/share/magicseteditor/data
	bsdtar -xf poker.mse-installer
	chmod -x ./*.mse-{style,game,symbol-font}/*
	cp -r ./*.mse-{style,game,symbol-font} $pkgdir/usr/share/magicseteditor/data
}
