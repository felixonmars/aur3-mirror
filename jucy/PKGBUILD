# Contributor: Lex Black <autumn-wind at web dot de>
# Contributor: Superstar655 <choman000 at hotmail dot com> (disguise your email to protect against spam)

pkgname=jucy
pkgver=0.87
pkgrel=1
pkgdesc="Direct connect client"
arch=('i686' 'x86_64')
url="http://www.jucy.eu/"
depends=('java-runtime<8')
makedepends=('imagemagick')
license=('custom')
[ "${CARCH}" = "i686" ]     && KARCH=x86 && sha1sums=('0548aeb2702215e5fe2d0bd1f6e97aff38f10535' 'ff3824e6845941ab1800eff4fc740022d1bdad6f')
[ "${CARCH}" = "x86_64" ]   && KARCH=x86_64 && sha1sums=('21a2fe798b119db2aaec9b4463c46b327969ef27' 'ff3824e6845941ab1800eff4fc740022d1bdad6f')
source=("$pkgname-$pkgver.zip::http://www.jucy.eu/download.php?filename=jucy.linux.gtk.${KARCH}.zip"
	"jucy.desktop")


package() {
	mkdir -p $pkgdir/opt/jucy
	cp -r $srcdir/jucy/* $pkgdir/opt/jucy

	install -d -m 755 $pkgdir/usr/share/pixmaps
	convert $pkgdir/opt/jucy/icon.xpm $pkgdir/jucy.png
	install -D -m 644 $pkgdir/jucy.png $pkgdir/usr/share/pixmaps/jucy.png
	rm $pkgdir/jucy.png

	mkdir -p $pkgdir/usr/share/applications
	install -D -m 644 $srcdir/jucy.desktop $pkgdir/usr/share/applications/jucy.desktop
}
