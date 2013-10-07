# Original autor: Martin Kumm <pluto@ls68.de> 
# Maintainer: Manuel Schoenlaub <manuel.schoenlaub@gmail.com>
# Last edited: 3nd October 2013

pkgname=texlive-czt
pkgver=1.3
pkgrel=1
license=('GPL')
depends=('texlive-core')
pkgdesc="A LaTeX package for Z specifications intended for use with Community Z Tools (CZT)"
url="http://czt.sourceforge.net/latex/"
arch=('any')
install=texlive-czt.install
source=(
	http://czt.sourceforge.net/latex/z/czt.sty
	http://czt.sourceforge.net/latex/circus/circus.sty
)

md5sums=('817b802d1eed142d6cefed17dff5961e'
         '781e10eb933ea983a7dc236a9c36291e')


package()
{
  mkdir -p $pkgdir/usr/share/texmf/tex/latex/objectz
  cp $srcdir/*.sty $pkgdir/usr/share/texmf/tex/latex/objectz/
}
