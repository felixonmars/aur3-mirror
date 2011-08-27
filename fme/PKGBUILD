# Maintainer Paolo Fagni <paolo.fagni@gmail.com>
# Contributor Paolo Fagni <paolo.fagni@gmail.com>
pkgname=fme
pkgver=1.1.2
pkgrel=2
pkgdesc="Fluxbox Menu Editor is a nice and useful menu editor for the Fluxbox WM"
url="http://code.google.com/p/fluxbox-menu-editor/"
license=('GPL')
arch=('i686' 'x86_64')
depends=('pkgconfig' 'glibmm' 'libglademm' 'gettext' 'boost' 'bc' 'fluxbox')
source=(http://fluxbox-menu-editor.googlecode.com/files/$pkgname-$pkgver.tar.gz)
md5sums=('9e52572ea42c8c4cca4d79fa8739b4fe')


build() {
	cd $startdir/src/$pkgname-$pkgver
	./configure --prefix=/usr
	make || return 1
	make prefix=$startdir/pkg/usr install
}
