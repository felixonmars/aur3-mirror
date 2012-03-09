# Maintainer: Luca Bennati <lucak3 AT gmail DOT com>

pkgname=ustl
pkgver=1.6
pkgrel=1
pkgdesc="The small STL C++ library"
arch=('i686' 'x86_64')
url="http://ustl.sourceforge.net/"
license=('MIT')
source=("http://downloads.sf.net/sourceforge/${pkgname}/${pkgname}-${pkgver}.tar.bz2")
md5sums=('60fd685f069ac67271dd5e63b4ec06d8')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  ./configure --prefix=/usr \
    --with-static

  make
  #make html
}

check() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  make -k check
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  sed -i -e '71,$ s/\$@/\$\(DESTDIR\)\$@/' \
    -e '93 s/@;.*/@\)/' Makefile

  make DESTDIR="${pkgdir}" install
  ln -s "/usr/lib/lib${pkgname}.so.${pkgver}" "${pkgdir}/usr/lib/lib${pkgname}.so"

  # TODO: documentation
}

# vim:set ts=2 sw=2 et:
