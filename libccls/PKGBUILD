# Maintainer : Pablo Nicolas Diaz Bilotto <pablonicolas.diaz en gmail.com>

pkgname=libccls
pkgver=0.8.1
pkgrel=1
pkgdesc="Mkahawa is an open-source project that builds on Cafe Con Leche or CCL - the nifty, cross-platform Internet Cafe billing and Management Software started by Bruno Deferrari. CCL server library"
arch=('i686' 'x86_64')
license=('custom')
url="http://mkahawa.sourceforge.net/index.php"
depends=('glibc' 'sqlite3' 'fox>=1.4' 'openssl')
#makedepends=('texinfo>=4.8a')
#install=${pkgname}.install
source=(http://www.mkahawa.net/downloads/${pkgname}_${pkgver}-1_i386.tar.bz2)

build() {
  cd ${srcdir}/${pkgname}
#  for i in ${srcdir}/*.patch; do
#	patch -Np1 -i $i || return 1
#  done
  ./configure --prefix=/usr # --bindir=/bin --without-included-regex
  make || return 1
  make DESTDIR=${pkgdir} install || return 1

#  rm -f ${pkgdir}/usr/share/info/dir
#  gzip -9 ${pkgdir}/usr/share/info/*
}
md5sums=('f9150d44594750570eac2c98e719187e')
