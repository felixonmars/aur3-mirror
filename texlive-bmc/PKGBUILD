pkgname=texlive-bmc
pkgver=1.06
pkgrel=1
license=(unknown)
depends=()
pkgdesc="A TeX template for BioMed Central and SpringerOpen."
url="http://www.biomedcentral.com/authors/tex"
arch=('any')
install=$pkgname.install
source=(http://media.biomedcentral.com/content/production/bmc_article-tex.zip)
md5sums=('df5e5b9203c87acd1b3fa1214a7fe0a4')

package()
{
  TEXDIST=usr/share/texmf-dist
  install -m755 -d $pkgdir/$TEXDIST/tex/latex/bmc
  install -m755 -d $pkgdir/$TEXDIST/bibtex/bst/bmc
  install -m644 $srcdir/bmc_template/bmcart.cls $pkgdir/$TEXDIST/tex/latex/bmc
  install -m644 $srcdir/bmc_template/bmcart-biblio.sty $pkgdir/$TEXDIST/tex/latex/bmc
  install -m644 $srcdir/bmc_template/bmc-mathphys.bst $pkgdir/$TEXDIST/bibtex/bst/bmc
}

