# Contributor: Sapphira Armageddos <shadowkyogre@aim.com>
pkgname=mse-ygo-xyz
pkgver=2.0.0
pkgrel=6
pkgdesc="YugiOh template with xyz additions for Magic Set Editor."
arch=(any)
url="http://forum.yugiohcardmaker.net/topic/240063-mse-xyz-monsters-v5-now-you-can-make-your-own/"
license=('freeware')
depends=('magicseteditor')
makedepends=('unzip')
conflicts=('mse-ygo')
provides=('mse-ygo')
source=('http://dl.dropbox.com/u/12096853/XyzV5.zip')

md5sums=('e3c993472885fd01ceb12c945ab232b5')
noextract=('XyzV5.zip')

build() {
	cd $srcdir
	unzip XyzV5.zip
	mkdir -p $pkgdir/usr/share/magicseteditor/data

	rm -vf ./data/*.mse-symbol-font/build.bat
	cp -r ./data/*.mse-{symbol-font,game,style} $pkgdir/usr/share/magicseteditor/data
}

# vim:set ts=2 sw=2 et:
