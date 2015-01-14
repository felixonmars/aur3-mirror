# Developer: Ronny Wegener <wegener.ronny@gmail.com>
# Maintainer: Jan Keith Darunday <jkcdarunday@uplb.edu.ph>

pkgname=hakuneko
pkgver=1.3.6
pkgrel=1
pkgdesc="A Manga Downloader for Linux"
arch=('i686' 'x86_64')
url="http://sourceforge.net/projects/hakuneko/"
license=('MIT')
depends=('pacman' 'wxgtk2.8')
makedepends=('tar')
source=("http://downloads.sourceforge.net/project/hakuneko/${pkgname}_${pkgver}_src.tar.gz" wxversionfix.patch)
md5sums=('c89fec04c9aaee2251318663b7c340b9'
         '42545a25af94b4020400e5cf21df1da4')

build() {
	cd "${pkgname}_${pkgver}_src"
	patch -Np1 -i ${srcdir}/wxversionfix.patch config_default.sh
	./configure
	make
}

package() {
	cd "${pkgname}_${pkgver}_src"
	make PREFIX=/usr DESTDIR="$pkgdir" install
	install -Dm644 "$srcdir/${pkgname}_${pkgver}_src/res/app.ico" "$pkgdir/usr/share/pixmaps/hakuneko.ico"
}
