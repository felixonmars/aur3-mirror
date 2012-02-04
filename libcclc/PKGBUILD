# Maintainer : Pablo Nicolas Diaz Bilotto <pablonicolas.diaz en gmail.com>

pkgname=libcclc
pkgver=0.8.0
pkgrel=1
pkgdesc="Mkahawa is an open-source project that builds on Cafe Con Leche or CCL - the nifty, cross-platform Internet Cafe billing and Management Software started by Bruno Deferrari. - CCL client library"
arch=('i686' 'x86_64')
license=('custom')
url="http://mkahawa.sourceforge.net/index.php"
source=(http://www.mkahawa.net/downloads/${pkgname}_${pkgver}-1_i386.tar.bz2)

build() {
  cd ${srcdir}/${pkgname}
  ./configure --prefix=/usr # --bindir=/bin --without-included-regex
  make || return 1
  make DESTDIR=${pkgdir} install || return 1
}
md5sums=('81fa49bd5a00d572286a2ac4593e42fd')
