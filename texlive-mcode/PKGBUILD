# Original author: Florian Knorn
# Maintainer: Feynman Liang <feynman dot liang at gmail dot com>
# Last edited: December 26, 2014

pkgname=texlive-mcode
pkgver=1.0
pkgrel=3
license=('BSD')
pkgdesc="Easily include nicely syntax highlighted m-code in your LaTeX documents."
url="http://www.mathworks.com/matlabcentral/fileexchange/8015-m-code-latex-package"
arch=('any')
install=texlive-mcode.install
source=(http://www.mathworks.com/matlabcentral/fileexchange/submissions/8015/v/19/download/zip)
md5sums=('7553383796782a495d572365e9b0c6f3')

package()
{
  mkdir -p $pkgdir/usr/share/texmf/tex/latex/mcode
  cp $srcdir/mcode/mcode.sty $pkgdir/usr/share/texmf/tex/latex/mcode

  mkdir -p $pkgdir/usr/share/licenses/texlive-mcode
  cp $srcdir/license.txt $pkgdir/usr/share/licenses/texlive-mcode
}
