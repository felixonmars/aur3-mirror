# Contributor: Gabor Garami <hrgyster@gmail.com>
pkgname=sun-backgrounds
pkgver=0.1
pkgrel=1
pkgdesc="Sun Solaris background themes"
arch=(i686 x86_64)
makedepends=(gnome-common)
url="http://www.oracle.com/solaris"
license=(GPL)
groups=('gnome')

source=(
	http://dlc.sun.com/osol/jds/downloads/extras/${pkgname}-${pkgver}.tar.bz2
)

md5sums=('b17050d9a3df6a08f24ce29b55c7cff2')
sha1sums=('896b62a1ab644f0487025d992e56aeff9b19a7ce')

build() {
	cd ${srcdir}/${pkgname}-${pkgver}
	./configure --prefix=/usr --mandir=/usr/share/man
	make || return 1
	make DESTDIR=${pkgdir} install || return 1
}
