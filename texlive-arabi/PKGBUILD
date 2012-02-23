# Maintainer: M Rawash <mrawash@gmail.com>
pkgname=texlive-arabi
pkgver=1.1
pkgrel=1
pkgdesc="(La)TeX support for Arabic and Farsi, compliant with Babel"
arch=(any)
url="http://www.ctan.org/tex-archive/language/arabic/arabi"
license=('LPPL')
depends=(texlive-core)
makedepends=(unzip)
install=$pkgname.install
source=(http://mirror.ctan.org/language/arabic/arabi.zip)
md5sums=('adf6be92c3ebff0f574f24ce75b516a6')

build() {
  cd "$srcdir/arabi/arabi/texmf"
  
  mkdir -p "$pkgdir/usr/share/texmf/tex"
  cp -r latex "$pkgdir/usr/share/texmf/tex"
  cp -r doc/latex "$pkgdir/usr/share/texmf/doc"
  cp -r {fonts,dvips} "$pkgdir/usr/share/texmf"
}

# vim:set ts=2 sw=2 et:
