# Maintainer: Ran Benita <ran234@gmail.com>

pkgname=texlive-zed-csp
pkgver=0c
pkgrel=1
license=('custom')
depends=('texlive-core')
pkgdesc="A LaTeX package for typesetting Z and CSP format specifications"
url="https://www.ctan.org/pkg/zed-csp"
arch=('any')
install=texlive-zed-csp.install
source=(http://mirrors.ctan.org/macros/latex/contrib/zed-csp/zed-csp.sty)
sha1sums=('841cc12481055f8b8bf201eedaa4efb588e2b123')

build() {
  sed -n '/(c) /,/the results under/ s/% //p' $srcdir/zed-csp.sty > LICENSE
}

package() {
  install -Dm644 LICENSE $pkgdir/usr/share/licenses/$pkgname/LICENSE
  install -Dm644 $srcdir/zed-csp.sty $pkgdir/usr/share/texmf/tex/latex/zed-csp/zed-csp.sty
}
