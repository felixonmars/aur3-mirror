#  Contributor: Stefan Husmann <stefan-husmann@t-online.de>
pkgname=concordance  
pkgver=1.0
pkgrel=2
pkgdesc="A LaTeX package for typesetting concordance output."
url="http://www.andy-roberts.net/misc/latex/packages.html"
arch=('i686')
license=('unknown')
depends=('texlive-core')
install=concordance.install
source=(http://www.andy-roberts.net/misc/latex/packages/$pkgname.zip)
md5sums=('2361cb35e9b8ef3e2b1ba47e44c69c26')
build() {
  cd $startdir/src/$pkgname
  install -D -m644 $pkgname.sty \
    $startdir/pkg/opt/texlive/texmf-local/tex/latex/$pkgname/$pkgname.sty
  install -D -m644 $pkgname.tex \
    $startdir/pkg/opt/texlive/texmf-local/doc/$pkgname/$pkgname.tex
  install -D -m644 $pkgname.pdf \
    $startdir/pkg/opt/texlive/texmf-local/doc/$pkgname/$pkgname.pdf
  install -d $startdir/pkg/usr/share/licenses/$pkgname
}