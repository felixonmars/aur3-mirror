# Contributor: Andrzej Zbrzezny <a.zbrzezny@gmail.com>

pkgname=algorithmicx
pkgver=20050428
pkgrel=2
pkgdesc="Provides many possibilities to customize the layout of algorithms"
arch=('any')
url="http://www.ctan.org/tex-archive/macros/latex/contrib/algorithmicx/"
license=('custom:"LPPL"')
depends=('tetex')
install=algorithmicx.install
source=(http://tug.ctan.org/pub/tex-archive/macros/latex/contrib/algorithmicx.zip)
md5sums=('9bca5e09830f3d84e3beb037690f10e7')

build() {
  cd $startdir/src/$pkgname
  install -d $startdir/pkg/usr/share/texmf/tex/latex/algorithmicx
  install -m644 $startdir/src/$pkgname/{README,*.sty,*.tex} $startdir/pkg/usr/share/texmf/tex/latex/algorithmicx
}
