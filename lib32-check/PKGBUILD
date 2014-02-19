# Maintainer: Jaroslav Lichtblau <dragonlord@aur.archlinux.org>
# Maintainer: goodmenzy <goodmenzy@gmail.com>
# Contributor: Jeremy Cowgar <jeremy@cowgar.com>

_pkgbasename=check
pkgname=lib32-$_pkgbasename
pkgver=0.9.11
pkgrel=1
pkgdesc="A unit testing framework for C (32-bit)"
arch=('i686' 'x86_64')
url="http://check.sourceforge.net/"
license=('LGPL')
options=('!libtool')
depends=('lib32-glibc')
install=$_pkgbasename.install
source=(http://downloads.sourceforge.net/sourceforge/$_pkgbasename/$_pkgbasename-$pkgver.tar.gz)
md5sums=('fd5a03979bcab9fb80ba005b55f54178')

build() {
  cd ${srcdir}/$_pkgbasename-$pkgver

  CFLAGS="-m32" LDFLAGS="-m32" ./configure --prefix=/usr --libdir=/usr/lib32
  make || return 1
  make DESTDIR=${pkgdir} install

#get rid of the package's info directory, install-info adds entries for us at install-time
  rm ${pkgdir}/usr/share/info/dir || return 1
}
