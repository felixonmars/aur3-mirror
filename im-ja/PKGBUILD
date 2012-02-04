# Contributor: Simon Lipp <sloonz+aur@gmail.com>

pkgname=im-ja
pkgver=1.5
pkgrel=1
pkgdesc="Japanese input method for X and GTK+"
arch=(i686 x86_64)
url="http://im-ja.sourceforge.net/"
license=(LGPL GPL BSD)
depends=('gtk2' 'libglade' 'gettext' 'gconf')
makedepends=('gtk2' 'libglade' 'gettext' 'gconf' 'make' 'autoconf' 'automake' 'libtool')
source=("http://im-ja.sourceforge.net/im-ja-${pkgver}.tar.gz")
install=im-ja.install
md5sums=('8986574373d03e685730e16d8f15ade9')

build() {
	cd $startdir/src/$pkgname-$pkgver
	./configure --prefix=/usr --disable-gnome && make || return 1
	make DESTDIR=$startdir/pkg install || return 1
}
