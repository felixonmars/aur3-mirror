# Contributor: noonov <noonov@gmail.com>

pkgname=hyperestraier
pkgver=1.4.13
pkgrel=4
pkgdesc="A full-text search system"
arch=('i686' 'x86_64')
url="http://fallabs.com/hyperestraier/index.html"
license=('LGPL2.1')
depends=('qdbm')
source=(http://fallabs.com/hyperestraier/${pkgname}-${pkgver}.tar.gz)

build() {
  cd ${srcdir}/${pkgname}-${pkgver}

  case "${CARCH}" in
  i686)
    sed -i -e "s|@MYCFLAGS@|${CFLAGS}|g" Makefile.in
    ;;
  x86_64)
    sed -i -e "s|@MYCFLAGS@|${CFLAGS} -fPIC|g" -e "s|-shared|-shared -fPIC|g" Makefile.in
    ;;
  esac

  ./configure --prefix=/usr --mandir=/usr/share/man --libexecdir=/usr/lib/${pkgname}
  make
}

package() {
  cd ${srcdir}/${pkgname}-${pkgver}

  make DESTDIR=${pkgdir} install

  # rm -rf ${pkgdir}/usr/share/${pkgname}/doc
}

md5sums=('847aefb9e23266545280378d797f3981')
