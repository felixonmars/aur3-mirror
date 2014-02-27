# Maintainer: Artem Sheremet <dot.doom@gmail.com>
#

pkgname=bmkdep-git
pkgver=20140227
pkgrel=1
pkgdesc='NetBSD mkdep: construct Makefile dependency list'
arch=('i686' 'x86_64')
url='https://code.google.com/p/bmkdep/'
license=('custom')
depends=('glibc')
provides=('bmkdep')
makedepends=('git' 'bmake')
source=("${pkgname}::git+https://code.google.com/p/bmkdep/")
md5sums=('SKIP')

build() {
	cd "$srcdir/$pkgname"
	sed -i 's/MANDIR=/MANDIR?=/' Makefile
	PREFIX=/usr bmake
}

package() {
	cd "$srcdir/$pkgname"

	install -dm0755 "$pkgdir/usr/bin"
	install -dm0755 "$pkgdir/usr/share/man/cat1"
	PREFIX="$pkgdir/usr" MANDIR="$pkgdir/usr/share/man" bmake install

	install -dm0755 "$pkgdir/usr/share/licenses/$pkgname"
	head -n30 mkdep.c >"$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
