# Contributor: Jim Pryor <jim@jimpryor.net>

pkgname=members
pkgver=20080128_5
pkgrel=1
pkgdesc="shows the members of a group; by default, all members"
arch=('i686' 'x86_64')
url='http://packages.qa.debian.org/m/members.html'
license=('GPL')

source=("http://ftp.de.debian.org/debian/pool/main/m/members/${pkgname}_${pkgver/_/-}.tar.gz")
md5sums=('187675ea49544377c38ea007306efdcf')

build() {
	cd "$srcdir/$pkgname-${pkgver%_*}"

	mkdir -p $pkgdir/usr/{bin,share/man/man1}
	make || return 1
	make DESTDIR="$pkgdir" install || return 1
	chown root:root $pkgdir/usr/bin/members
	cp members.1 $pkgdir/usr/share/man/man1

}

# vim:syntax=sh

