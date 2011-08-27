# $Id$
# Maintainer: Guan 'kuno' Qing <neokuno AT gmail DOT com>

pkgname=v8-docs
pkgver=3.4.12.1
pkgrel=1
pkgdesc='API reference guide for google v8 javascript engine'
arch=('any')
url='http://code.google.com/p/v8'
license=('BSD')
install="${pkgname}".install
makedepends=('subversion' 'doxygen')
source=(Doxyfile)

build() {
  _source="http://v8.googlecode.com/svn/tags/$pkgver"
  svn checkout "$_source" "$srcdir/$pkgname-$pkgver"

  cd "${srcdir}/${pkgname}-${pkgver}" || return 1

  if [ ! -f Doxyfile ] && [ ! -L Doxyfile ]; then
    ln -s "${srcdir}"/Doxyfile . || return 1
  fi

  # Generated documents
  doxygen || return 1
}
package() {                                      
  mkdir -p "${pkgdir}"/usr/share/doc/v8 || return 1
  cp -r "${srcdir}/${pkgname}-${pkgver}"/doxygen/* "${pkgdir}"/usr/share/doc/v8 || return 1
}
md5sums=('51b3337b40d171b06f58a2721dc97cd2')
