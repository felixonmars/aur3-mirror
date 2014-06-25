# Maintainer: Bastien Dejean <nihilhill@gmail.com>

_pkgname=slrn
pkgname=${_pkgname}-git
pkgver=349
pkgrel=1
pkgdesc='An open source text-based news client'
arch=('i686' 'x86_64')
url="http://www.${_pkgname}.org/"
license=('GPL')
depends=('slang-git' 'uudeview')
makedepends=('git')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
backup=("etc/slrnrc")
source=("git://git.jedsoft.org/git/${_pkgname}.git")
md5sums=('SKIP')

pkgver() {
	cd "$_pkgname"
	git rev-list --count HEAD
}

build() {
	cd "$_pkgname"
	./configure --prefix=/usr --sysconfdir=/etc \
	    --enable-setgid-code \
	    --with-slrnpull --with-ssl --with-uu \
	    --with-uulib=/usr/lib/uudeview \
	    --with-uuinc=/usr/include/uudeview \
	    --enable-spoilers
	make
}

package() {
	cd "$_pkgname"
	make DESTDIR="$pkgdir" install
	install -D -m755 contrib/cleanscore "${pkgdir}/usr/bin/cleanscore"
	install -D -m644 doc/slrn.rc "${pkgdir}/etc/slrnrc"
}
