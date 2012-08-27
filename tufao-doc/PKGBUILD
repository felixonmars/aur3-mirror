# Maintainer: Vinícius dos Santos Oliveira <vini.ipsmaker@gmail.com>
pkgname=tufao-doc
pkgver=0.4.0
pkgrel=1
pkgdesc="The Tufão documentation"
arch=(any)
url="http://tufao.googlecode.com/"
license=('MIT')
depends=()
source=("http://tufao.googlecode.com/files/tufao-${pkgver}-doc.zip")
md5sums=('d450b3aaa5f62f059652ba10b5d6a38b')

package() {
  cd "$srcdir"

  mkdir -p "$pkgdir/usr/share/doc"
  cp -r tufao "$pkgdir/usr/share/doc"
}
