# Contributor: Thomas Karmann <thomas@krmnn.de>
# Maintainer: Laszlo Papp <djszapi at gmail com>
pkgname=faucc
pkgver=20090220
pkgrel=2
pkgdesc="Optimizing C compiler that can generate Intel code for 16bit/32bit CPUs."
arch=('i686')
url="http://www3.informatik.uni-erlangen.de/Research/FAUcc/"
license=('GPL')
depends=('glibc')
makedepends=('docbook-xsl' 'xmlto' 'pkgconfig' 'autoconf' 'make')
source=(http://www3.informatik.uni-erlangen.de/Research/FAUcc/downloads/${pkgname}-${pkgver}.tar.gz)
md5sums=('57f4150a5dc485a5c516c44c62ad7558')

build() {
  cd ${srcdir}/${pkgname}-${pkgver}
  ./autogen.sh
  ./configure --prefix=/usr --mandir=/usr/share/man
  make || return 1
  make DESTDIR=${pkgdir} install || return 1
}
