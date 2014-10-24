# Maintainer: Petar Koretic <petar.koretic@sartura.hr>

pkgname=opkg-git
_gitname=opkg
pkgver=959
pkgrel=1
pkgdesc='Opkg is a lightweight package management system.'
url='http://git.yoctoproject.org/cgit/cgit.cgi/opkg/'
arch=('i386' 'x86_64')
license=('GPLv2')
depends=('')
makedepends=('git' 'autoconf' 'gcc')
provides=('opkg-git')
conflicts=('opkg')
source=('git://git.yoctoproject.org/opkg')
md5sums=('SKIP')

pkgver() {
	cd "$srcdir/$_gitname"

	echo `git rev-list --count HEAD`
}

prepare() {
	cd "$srcdir/$_gitname"

	./autogen.sh
}

build() {
	cd "$srcdir/$_gitname"

	 ./configure \
		 --prefix=/usr \
		 --disable-curl \
		 --disable-gpg \
		 --with-opkgetcdir=/etc

	make
}

package() {
	cd "$srcdir/$_gitname"

	make DESTDIR="$pkgdir" install
}
