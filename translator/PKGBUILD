# Maintainer: archtux <antonio.arias99999@gmail.com>

pkgname=translator
pkgver=0.9.12.20
pkgrel=1
pkgdesc="Application that translates text via Google Translate engine"
arch=('i686' 'x86_64')
url="http://www.qt-apps.org/content/show.php/ASTranslator?content=100039"
license=('GPL2')
depends=('qt' 'openssl')
source=("http://alexsnet.ru/wp-content/uploads/2009/02/ASTranslator.zip"
	'translator.desktop')
md5sums=('37f94cdec905c16bcf2ded14e6c71ab7'
	 '69e22aaf715fe45259da8a69495cd9d8')

build() {
	cd $srcdir
	install -Dm644 translator.desktop $pkgdir/usr/share/applications/$pkgname.desktop
	cd ASTranslator
	qmake
	make
	install -Dm755 bin/Translator $pkgdir/usr/bin/$pkgname
	install -Dm644 src/res/icon-128.png $pkgdir/usr/share/pixmaps/$pkgname.png
}
