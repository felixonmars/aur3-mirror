# Contributor: Dieter Plaetinck <dieter@plaetinck.be>
# Contributor: Thomas Jost <schnouki@schnouki.net>
# Maintainer: Conley Moorhous <conleymoorhous@gmail.com> 

pkgname=xtrace
pkgver=1.3.1
pkgrel=2
pkgdesc="Xtrace fakes an X server and forwards all connections to a real X server, displaying the communication between the clients and the server in a human readable form"
arch=('i686' 'x86_64')
license=('GPL')
url="http://xtrace.alioth.debian.org/"
depends=('glibc')
source=('http://ftp.de.debian.org/debian/pool/main/x/xtrace/xtrace_1.3.1.orig.tar.gz')
md5sums=('c87a2d2f63872f2f7530df0ac946058b')

prepare() {
	cd "$srcdir/$pkgname-$pkgver"
}
build() {
	cd "$srcdir/$pkgname-$pkgver"
	./configure --prefix=/usr
	make
}

check() {
	cd "$srcdir/$pkgname-$pkgver"
	make check
}

package() {
	cd "$srcdir/$pkgname-$pkgver"
	make DESTDIR="$pkgdir" install
	# Rename executable to x11trace since glibc owns xtrace
	mv "$pkgdir/usr/bin/xtrace" "$pkgdir/usr/bin/x11trace"
	# Rename man page to x11trace since glibc owns xtrace
	mv "$pkgdir/usr/share/man/man1/xtrace.1" "$pkgdir/usr/share/man/man1/x11trace.1"
}
