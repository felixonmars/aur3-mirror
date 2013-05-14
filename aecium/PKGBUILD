# Maintainer: 謝致邦 <Yeking@Red54.com>

pkgname=aecium
pkgver=20130428
pkgrel=1
pkgdesc="Amtium eFlow Client for GNU/Linux"
arch=('i686' 'x86_64' 'arm' 'armv6h' 'armv7h')
url="http://github.com/Red54/aecium"
license=('GPL2')
depends=('libpcap')
makedepends=('git' 'automake' 'autoconf')

build() {
	cd $srcdir
	if [[ -d $pkgname ]]; then
		cd $pkgname && git pull origin
	else
		git clone $url --depth 1
	fi
	rm -rf $srcdir/build
	cp -r $srcdir/$pkgname $srcdir/build
	cd $srcdir/build
	aclocal
	autoheader
	automake -a
	autoconf
	./configure --prefix=/usr
	make
}

package() {
	cd $srcdir/build
	make DESTDIR=$pkgdir install
}
