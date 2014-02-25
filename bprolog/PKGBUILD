# Maintainer: Davide Iosca <dvdios[at]aol[dot]com>
pkgname=bprolog
pkgver=8.1
pkgrel=1
pkgdesc="versatile and efficient constraint logic programming (CLP) system."
arch=('x86_64')
url="http://www.probp.com/"
license=('custom:bprolog')
source=("http://www.probp.com/download/bp81_linux64.tar.gz")

md5sums=('03e9c2ed2aff9e98673a69728968def1')

package() {
  cd BProlog
  install -Dm755 bp "${pkgdir}/usr/bin/bp"

  install -Dm644 Document/manual.pdf "${pkgdir}/usr/share/doc/${pkgname}/manual.pdf"

  #install -m755 -d "${pkgdir}/usr/share/${pkgname}"
  #install -m755 Tools/* "${pkgdir}/usr/share/${pkgname}/"
}
