# Contributer: giacomogiorgianni@gmail.com

pkgname=mutiara
pkgver=0.13.0
pkgrel=1
pkgdesc="Design motifs the fun way"
arch=('i686' 'x86_64')
url="http://mutiara.sourceforge.net/"
license=('GPL3')
depends=('gtk3' 'libgee06' 'intltool' 'gnome-doc-utils')
source=(http://dfn.dl.sourceforge.net/project/mutiara/$pkgname-$pkgver.tar.bz2)
md5sums=('a03feef5d5ee2ddb2be0f76c311b5c63')

build() {
   cd $srcdir/$pkgname-$pkgver
   ./configure --prefix=/usr LIBS="-lm"
   make
}

package() {
	cd $srcdir/$pkgname-$pkgver
	make DESTDIR=$pkgdir install
}
