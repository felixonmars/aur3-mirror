# Contributor: Sapphira Armageddos <shadowkyogre@aim.com>
pkgname=mse-tarot-template
pkgver=2.0.0
pkgrel=2
pkgdesc="Tarot template for Magic Set Editor"
arch=('any')
url="http://magicseteditor.sourceforge.net"
license=('GPL')

depends=('magicseteditor' 'ttf-tangiers')
source=("tarot.zip::http://mtg.pifro.com/download/file.php?id=1245&sid=03c3bc0ed8480793688c7f7f8b03ce50")

md5sums=('e6c1df3bd9aff9c4084b0510f51da625')

build() {
	mkdir -p $pkgdir/usr/share/magicseteditor/data
	bsdtar -xf tarot.mse-installer
	sed -e 's|name: Algerian|name: Tangiers|g' -i ./*.mse-style/style
	chmod -x ./*.mse-{style,game}/*
	cp -r ./*.mse-{style,game} $pkgdir/usr/share/magicseteditor/data
}

# vim:set ts=2 sw=2 et:
