# Maintainer: AaronP <aaronbpaden at that google place>
pkgname=yarpt
pkgver=20120207
pkgrel=1
pkgdesc="Yet Another Run PrompT written in the D Programming Language"
arch=(any)
url="https://github.com/BPaden/yarpt"
license=(custom:"UNLICENSE")
depends=(gtkd)
makedepends=(dmd)

_gitroot="git://github.com/BPaden/yarpt.git"

build() {
	cd "$srcdir"

	msg "Connecting to GIT server...."
	if [ -d $pkgname ] ; then
		cd $pkgname && git pull origin
		msg "The local files are updated."
	else
		git clone $_gitroot $pkgname
	fi
	msg "GIT checkout done or server timeout"

	cd "$srcdir/$pkgname"
	make
}

package() {
	cd "$srcdir/$pkgname"
	install -D -m644 UNLICENSE "$pkgdir/usr/share/licenses/$pkgname/UNLICENSE"
	make PREFIX="/usr" DESTDIR="$pkgdir" install
}
