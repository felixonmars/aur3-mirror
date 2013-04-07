# Maintainer: Trần Đức Nam <dynamo.foss@gmail.com>
pkgname=bahamas-font
pkgver=1.0
pkgrel=1
pkgdesc="Font Bahamas"
arch=('any')
url=('http://nale12.deviantart.com/art/Boje-1-2-0-342853818')
license="GPL"
depends=('fontconfig' 'xorg-fonts-encodings' 'xorg-font-utils')
source=('http://dl.dropbox.com/u/53319850/NoobsLab.com/bahamas-font.zip')
md5sums=('34e07ac6b3f58be21f1c01dcd05446dd')


package() {
	cd $srcdir
	unzip bahamas-font.zip
	mkdir -p $pkgdir/usr/share/fonts/TTF
	cp -R *.TTF $pkgdir/usr/share/fonts/TTF
}
