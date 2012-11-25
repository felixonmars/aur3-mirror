# Maintainer: 謝致邦 <Yeking@Red54.com>

pkgname=aecium
pkgver=20121114
pkgrel=2
pkgdesc="Amtium eFlow Client for GNU/Linux"
arch=('i686' 'x86_64' 'arm' 'armv6h' 'armv7h')
depends=('libpcap')
makedepends=('git' 'automake' 'autoconf' 'libtool')
url="http://github.com/Red54/aecium"
license=('GPL2')

build() {
	cd $srcdir
	git clone http://github.com/Red54/aecium
	cd aecium
	aclocal
	autoheader
	automake --add-missing
	autoconf
	./configure --prefix=/usr
	make
}

package(){
	cd $srcdir/aecium
	make DESTDIR=$pkgdir install
}
