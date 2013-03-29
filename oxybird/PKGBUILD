# Maintainer: Elia Notarangelo <elia.notarangelo AT gmail DOT com>

pkgname=oxybird
pkgver=0.2
pkgrel=1
pkgdesc="gtk 3 theme for xfce"
url="http://xfce-look.org/content/show.php/?content=151216"
license=('GPL')
arch=('any')
makedepends=(gtk-engine-murrine)
options=()
source=("http://master.dl.sourceforge.net/project/archmind/$pkgname-$pkgver.tar.gz")

package() {
	cd ${srcdir}/$pkgname-$pkgver
	mkdir -p "${pkgdir}"/usr/share/themes
	cp -rf Oxybird "${pkgdir}"/usr/share/themes/

}


md5sums=('3ca03232d34f0a14ca272a4f14d292e5')
