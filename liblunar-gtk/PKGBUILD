# Contributor: Wu Xiaotian <yetist@gmail.com>
pkgname=liblunar-gtk
pkgver=2.2.4
pkgrel=1
pkgdesc="Chinese Lunar Library Gtk+ widget"
arch=("i686" "x86_64")
url="http://code.google.com/p/liblunar/"
license=('GPL2')
depends=('gtk2>=2.16' 'liblunar>=2.2.1')
optdepends=('python: python binding')
makedepends=('gtk2>=2.16' 'pygtk' 'gtk-doc' 'liblunar>=2.2.1')
source=("http://liblunar.googlecode.com/files/$pkgname-$pkgver.tar.gz")
md5sums=('978c77243ede27f2cbf0ff40bae1584e')

build() {
        cd "$srcdir/$pkgname-$pkgver"
	./configure --prefix=/usr --enable-python --enable-gtk-doc || return 1
        make || return 1
        make DESTDIR=$pkgdir install || return 1
}
