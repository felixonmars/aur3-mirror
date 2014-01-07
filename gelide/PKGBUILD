# Contributor: kagan <juanynie AT gmail DOT com>

pkgname=gelide
pkgver=0.1.5
pkgrel=4
pkgdesc="Gelide is a front-end for any emulated system"
url="http://gelide.sourceforge.net/index.php"
license=("GPL")
arch=('i686' 'x86_64')
depends=('gtkmm' 'libxml2' 'intltool' 'gnome-icon-theme' 'gnome-doc-utils')
makedepends=
source=(http://downloads.sourceforge.net/gelide/$pkgname-$pkgver.tar.gz $pkgname-$pkgver.patch)
md5sums=('c222b13e8d309b402a234b31f9a82ea5' '66ee12a195f3212e9776c8f4e92bcfba')

build() {
patch -p1 < $startdir/src/$pkgname-$pkgver.patch
cd $srcdir/$pkgname-$pkgver
./configure --prefix=/usr
make || return 1
}
package() {
cd $srcdir/$pkgname-$pkgver
make DESTDIR=$pkgdir install
}