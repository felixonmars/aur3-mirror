# Maintainer: Stephen Gilles <stephendgilles@gmail.com>

pkgname=biblatex-mla
pkgver=0.8.1
pkgrel=1
pkgdesc="MLA style files for biblatex"
url="http://tug.ctan.org/tex-archive/macros/latex/exptl/biblatex-contrib/biblatex-mla/"
arch=('any')
license=('LPPL')
depends=('biblatex')
install=biblatex-mla.install
source=($pkgname-$pkgver.zip::http://tug.ctan.org/get/macros/latex/exptl/biblatex-contrib/biblatex-mla.zip)
md5sums=('318a2be5775b4d0ee80e4caf62f81a1e')

build() {
  cd $srcdir/biblatex-mla/latex
  install -d     $pkgdir/usr/share/texmf/tex/latex/biblatex/bbx
  install -d     $pkgdir/usr/share/texmf/tex/latex/biblatex/lbx
  install -d     $pkgdir/usr/share/texmf/tex/latex/biblatex/cbx

  install -m644 bbx/* \
    $pkgdir/usr/share/texmf/tex/latex/biblatex/bbx

  install -m644 lbx/* \
    $pkgdir/usr/share/texmf/tex/latex/biblatex/lbx

  install -m644 cbx/*.cbx \
    $pkgdir/usr/share/texmf/tex/latex/biblatex/cbx
    
  cd $srcdir/biblatex-mla/doc
  install -d $pkgdir/usr/share/texmf/doc/latex/biblatex/biblatex-mla
  install -m644 biblatex-mla.pdf \
  		examples/* \
  		$srcdir/biblatex-mla/README \
    $pkgdir/usr/share/texmf/doc/latex/biblatex/biblatex-mla
  
  cd $srcdir/biblatex-mla
  install -Dm644 README $pkgdir/usr/share/licenses/$pkgname/README
}

