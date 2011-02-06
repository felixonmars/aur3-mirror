# Maintainer: Davidov Denis <mail@tux.nsk.ru>

pkgname=stx-execpipe
pkgver=0.7.1
pkgrel=1
pkgdesc="Library provides a convenient C++ interface to execute child programs connected via pipes"
arch=('i686' 'x86_64')
url="http://idlebox.net/2010/stx-execpipe/"
license=('LGPL')
depends=()
source=(${url}/${pkgname}-${pkgver}.tar.bz2)
sha256sums=('df3d835ceec4f8a39f11acf72b15c1ac13ff7429bb03c0ce820073894492f6ac')

build() {
  cd ${srcdir}/${pkgname}-${pkgver}
  ./configure --prefix=/usr/
  make || return 1
  
  make DESTDIR=${pkgdir} install || return 1
}
