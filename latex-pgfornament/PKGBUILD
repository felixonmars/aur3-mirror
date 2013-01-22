#
# pgfornament - Produces vector ornaments with PGF/TiKZ fo LaTeX
#
# maintainer: i_magnific0 (i_magnific0@yahoo.com)

pname=pgfornament
pkgname=latex-$pname
pkgver=0.1
pkgrel=2
pkgdesc="Produces vector ornaments with PGF/TiKZ fo LaTeX"
arch=('any')
url="http://altermundus.com/pages/tkz/ornament/index.html"
license=('GPL')
depends=('texlive-bin' 'texlive-pictures')
source=("http://altermundus.com/pages/downloads/packages/pgfornament/pgfornament.zip")
md5sums=('973b9868d53e1d4c1e61e5df041ad349')
         
build() {
  pdir="$pkgdir/usr/share/texmf-dist/tex/latex/${pname}"
  gdir="$pkgdir/usr/share/texmf-dist/tex/generic"

  cd $srcdir/$pname
  install -dm755 $pdir
  install -dm755 $pdir/am
  install -dm755 $pdir/examples
  install -dm755 $pdir/vectorian
  install -dm755 $gdir/am
  install -dm755 $gdir/vectorian	

  install -Dm644 *.*           $pdir
  install -Dm644 *.code.tex    $pkgdir/usr/share/texmf-dist/tex/latex/

  install -Dm644 am/*.*        $pdir/am
  install -Dm644 examples/*.*  $pdir/examples
  install -Dm644 vectorian/*.* $pdir/vectorian
  install -Dm644 am/*.*        $gdir/am
  install -Dm644 vectorian/*.* $gdir/vectorian
}