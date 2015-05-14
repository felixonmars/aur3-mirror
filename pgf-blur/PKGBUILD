# Original autor: Martin Giese
# Last edited: 2012

pkgname=pgf-blur
pkgver=1.01
pkgrel=1
license=('custom')
depends=('texlive-latexextra')
pkgdesc="The pack­age adds blurred/faded/fuzzy shad­ows to PGF/TikZ pic­tures. It is con­fig­ured as a TikZ/PGF li­brary mod­ule."
url="http://www.ctan.org/pkg/pgf-blur"
arch=('any')
install=$pkgname.install
source=("http://mirrors.ircam.fr/pub/CTAN/graphics/pgf/contrib/${pkgname}.zip")
md5sums=('ecacc09406ce2d18776db68df000a90e')

package()
{
  mkdir -p $pkgdir/usr/share/texmf/tex/latex/$pkgname
  
  cd $srcdir/$pkgname
  latex $pkgname.dtx || return 1
  install -Dm644 tikzlibraryshadows.blur.code.tex $pkgdir/usr/share/texmf/tex/latex/$pkgname/tikzlibraryshadows.blur.code.tex 
}
