# Maintainer: Alex Hammel <ahammel87 at gmail dot com>
# Last edited: May 01, 2013

pkgname=texlive-chngcntr
pkgver=1.0a
pkgrel=1
license=(LPPL)
depends=(texlive-bin)
pkgdesc="A LaTeX package for changing the resetting of counters"
url="http://ctan.org/tex-archive/macros/latex/contrib/chngcntr"
arch=(any)
install=texlive-chngcntr.install
source=(http://mirrors.ctan.org/macros/latex/contrib/chngcntr.zip)
md5sums=(380ddb4a192b0255131f21b349eca1e6)

package()
{
  mkdir -p $pkgdir/usr/share/texmf/tex/latex/chngcntr
  cp $srcdir/chngcntr/chngcntr.sty $pkgdir/usr/share/texmf/tex/latex/chngcntr
}
