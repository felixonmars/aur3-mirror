# Maintainer: Marco Rocco <mr85mr@gmail.com>
pkgname=jgoogletranslator
pkgver=1.2
pkgrel=1
pkgdesc='A translator written in Java using Google online service'
arch=('any')
url='http://www.echlab.com/'
license=('GPL')
depends=('java-runtime')
source=("http://www.echlab.com/pub/jGoogleTranslator/jGoogleTranslator-$pkgver.tar.gz")
md5sums=('da337946f70db26cabb6a5e82480338a')


build() {
	# create directory
	install -d $pkgdir/usr/share/java/jGoogleTranslator/
	# install launcher file
	install -D -m755 $srcdir/jGoogleTranslator.sh "$pkgdir/usr/bin/jGoogleTranslator" || return 1
	install -D -m755 $srcdir/jGoogleTranslator.jar "$pkgdir/usr/share/java/jGoogleTranslator/"
	install -D -m644 "$srcdir/jGoogleTranslator.desktop" "$pkgdir/usr/share/applications/jGoogleTranslator.desktop" || return 1
	install -D -m644 "$srcdir/jGoogleTranslator.png" "$pkgdir/usr/share/pixmaps/jGoogleTranslator.png" || return 1
}
