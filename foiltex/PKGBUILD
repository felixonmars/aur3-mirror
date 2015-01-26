
pkgname=foiltex
pkgver=2.1.4b
pkgrel=3
pkgdesc="FoilTeX package for LaTeX2e."
arch=('i686' 'x86_64')
url="ftp://ctan.tug.org/tex-archive/help/Catalogue/entries/foiltex.html"
depends=('texlive-core')
makedepends=('texlive-core')
source=(ftp://cam.ctan.org/tex-archive/macros/latex/contrib/foiltex.zip)
md5sums=('0a6b4e64fb883a68d9b288bf3421db25')
install='foiltex.install'
license="Restrictive/Distributable"

package() {
  cd "$srcdir/foiltex"
  latex foiltex.ins || return 1
  mkdir -p "$pkgdir/usr/share/texmf-dist/tex/latex/foils"
  for i in foils.* foil*.clo fltfonts.def; do
    cp $i "$pkgdir/usr/share/texmf-dist/tex/latex/foils"
  done
}

