# Contributor: Sapphira Armageddos <shadowkyogre@aim.com>
pkgname=mse-mtg-phyrexian
pkgver=2.0.0
pkgrel=6
pkgdesc="Magic: the Gathering templates for Magic Set Editor."
arch=(any)
url="http://magicseteditor.sourceforge.net"
license=('freeware')
depends=('magicseteditor')
conflicts=('mse-mtg')
provides=('mse-mtg')
source=('http://downloads.sourceforge.net/magicseteditor/mse-linux32-2011-02-05-full.tar.gz'
"magic-mana-small-and-large.mse-installer::http://mtg.pifro.com/download/file.php?id=2850"
"magic-mana-future.mse-installer::http://mtg.pifro.com/download/file.php?id=2849"
"magic-mana-beveled.mse-installer::http://mtg.pifro.com/download/file.php?id=2848"
"magic.mse-installer::http://mtg.pifro.com/download/file.php?id=2865")
md5sums=('5b8144c7ab1a2d4747907e7a4de87bf8'
         'cfd7da8c7c212f109adb5aa26da8b780'
         '0e95f967272ce328b1bb35d517a62ba2'
         '91175d86443564b3dfbb539a992957a6'
         'f6d2d34606cbf95dafd9f1ffb7756105')

build() {
	cd $srcdir
	mkdir -p $pkgdir/usr/share/magicseteditor/data
	cp -r ./magicseteditor/program/data/{magic,archenemy,planechase}* $pkgdir/usr/share/magicseteditor/data
	bsdtar -xf magic-mana-small-and-large.mse-installer
	bsdtar -xf magic-mana-future.mse-installer
	bsdtar -xf magic-mana-beveled.mse-installer
	bsdtar -xf magic.mse-installer
	cp -r ./magic*.mse-{symbol-font,game} $pkgdir/usr/share/magicseteditor/data
}

# vim:set ts=2 sw=2 et:
