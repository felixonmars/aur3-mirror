# Maintainer: ShadowKyogre <shadowkyogre@aim.com>
pkgname=mse-ruletips-magic-template
pkgver=2.0.0
pkgrel=2
pkgdesc="Magic: the Gathering tip card template"
arch=('any')
url="http://magicseteditor.sourceforge.net/additional-templates"
license=('GPL')
depends=('mse-mtg')

source=("rulestip.mse-installer::http://mtg.pifro.com/download/file.php?id=891")
md5sums=('4a78a180f423a6090a810304fd13ea6e')

build() {
	cd $srcdir
	mkdir -p $pkgdir/usr/share/magicseteditor/data
	bsdtar -xf rulestip.mse-installer
	cp -r ./*.mse-style $pkgdir/usr/share/magicseteditor/data
}

# vim:set ts=2 sw=2 et: