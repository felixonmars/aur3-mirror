# Maintainer: Anton Bazhenov <anton.bazhenov at gmail>
# Contributor: Daenyth <Daenyth+Arch AT gmail DOT com>

pkgname=stx2any
pkgver=1.59
pkgrel=1
pkgdesc="A conversion utility from structured text (stx) into other formats"
arch=('any')
url="http://sange.fi/~atehwa/cgi-bin/piki.cgi/stx2any"
license=('custom')
depends=('python2' 'tidyhtml' 'w3m')
optdepends=('emacs: for emacs editing mode')
source=("http://sange.fi/~atehwa/Stx.tar.gz")
md5sums=('31e2ce428c4f2a0cfd285cb4b2d2d597')

build() {
  cd "${srcdir}/Stx"
  sed -i "s/ version.msg/#&/" Makefile
  sed -i "s/env python/&2/" scripts/html2stx
  make
}

package() {
  cd "${srcdir}/Stx"
  make DESTDIR="${pkgdir}" install
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

# vim:set ts=2 sw=2 et:
