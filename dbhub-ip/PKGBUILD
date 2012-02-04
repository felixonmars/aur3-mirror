# Maintainer: <fedor@yu.wildpark.net>

pkgname=dbhub-ip
_pkgname=dbhub
pkgver=0.451
pkgrel=1
pkgdesc='Direct Connect hub software, based on Open DC Hub but with many enhancements (with bind address patch).'
arch=('i686' 'x86_64')
url='http://www.dbhub.org'
license=('GPL')
depends=('libcap' 'openssl')
replaces=('dbhub')
makedepends=('perl>=5.10')
source=("http://downloads.sourceforge.net/${_pkgname}/${_pkgname}-$pkgver.tbz2"
    dbhub-bind.patch no_dunaloader.patch)

build() {
	cd "$srcdir/${_pkgname}-$pkgver"
	patch -Np0 -i ../dbhub-bind.patch || return 1
	patch -Np0 -i ../no_dunaloader.patch || return 1

	sed -i 's/^\(ACLOCAL=.*\)-${am__api_version}\(.*\)$/\1\2/' configure
	sed -i 's/^\(AUTOMAKE=.*\)-${am__api_version}\(.*\)$/\1\2/' configure

	aclocal
	autoconf

	./configure --prefix=/usr --enable-switch-user --enable-perl \
	CFLAGS="$CFLAGS" || return 1

	make || return 1
	make DESTDIR="$pkgdir" install || return 1
}

