# Contributor: Andrzej Zbrzezny <zbrzezny@pnet.pl>

pkgname=algorithmicx
pkgver=20050428
pkgrel=1
pkgdesc="Provides many possibilities to customize the layout of algorithms"
url="http://www.tug.org/tex-archive/macros/latex/contrib"
license=('custom:"LPPL"')
depends=('tetex')
install=algorithmicx.install
source=(http://www.tug.org/tex-archive/macros/latex/contrib/algorithmicx.zip)
md5sums=('0c3dc7becfa549948a273139a40a3f17')

build() {
  cd $startdir/src/$pkgname
  install -d $startdir/pkg/usr/share/texmf/tex/latex/algorithmicx
  install -m644 $startdir/src/$pkgname/{README,*.sty,*.tex} $startdir/pkg/usr/share/texmf/tex/latex/algorithmicx
}
