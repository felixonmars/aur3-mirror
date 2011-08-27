# Maintainer: Thomas Dziedzic < gostrc at gmail >
# Maintainer: Kenneth L.Li < ll03_11 at 163.com >


pkgname=quantlib-docs
pkgver=1.1
pkgrel=1
pkgdesc='HTML documentation for quantlib.'
arch=('any')
url='http://quantlib.org'
license=('BSD')
source=("http://downloads.sourceforge.net/project/quantlib/QuantLib/1.1/docs/QuantLib-docs-1.1-html.tar.gz")
package() {
  install -d ${pkgdir}/usr/share/doc/quantlib

  install -m644 QuantLib-docs-${pkgver}-html/* \
    ${pkgdir}/usr/share/doc/quantlib
}
md5sums=('395b14e2b6c5023da35da322344ea2c9')
