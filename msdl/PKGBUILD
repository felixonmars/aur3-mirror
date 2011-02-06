# Contributor: Nathan Owe ndowens04 at gmail dot com
# Contributor: noonov <noonov@gmail.com>

pkgname=msdl
pkgver=1.2.7_r2
_pkgver=${pkgver/_/-}
pkgrel=1
pkgdesc="A multi-protocol downloader for various streaming protocols"
arch=('i686' 'x86_64')
url="http://msdl.sourceforge.net/"
license=('GPL3')
depends=('glibc')
source=(http://downloads.sourceforge.net/msdl/${pkgname}-${_pkgver}.tar.gz)

build() {
  cd ${srcdir}/${pkgname}-${_pkgver}

  ./configure --prefix=/usr
  make
}

package() {
  cd ${srcdir}/${pkgname}-${_pkgver}

  make DESTDIR=${pkgdir} install
}

md5sums=('a2b37162115170cc59ff6ace1d9c5ac4')
