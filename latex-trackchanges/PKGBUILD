# Contributor: Daniel Ehlers <danielehlers@mindeye.net>

pkgname=latex-trackchanges
pkgver=0.7.0
pkgrel=1
pkgdesc='TrackChanges is a package for collaboratively editing LaTeX documents.'
arch=('any')
url='http://trackchanges.sourceforge.net/'
license=('GPL')
install='latex-trackchanges.install'
depends=('texlive-core')
source=("http://downloads.sourceforge.net/trackchanges/trackchanges-0.7.0.zip")

package() {
  cd trackchanges-${pkgver}

  install -d ${pkgdir}/usr/share/texmf-dist/tex/latex/trackchanges

  cp -R LatexPackage/trackchanges.sty ${pkgdir}/usr/share/texmf-dist/tex/latex/trackchanges
}
md5sums=('6056f861a40de9e8e54aadb5d1e57534')
