# Maintainer: Alex Hammel <ahammel87 at gmail dot com>
# Last edited: May 09, 2013

pkgname=texlive-tocbibind
pkgver=1.5k
pkgrel=1
license=(LPPL)
depends=(texlive-bin)
pkgdesc="A LaTeX package to add bibliography/index/contents to the table of contents"
url="http://www.ctan.org/tex-archive/macros/latex/contrib/tocbibind"
arch=(any)
install=texlive-tocbibind.install
source=(http://mirrors.ctan.org/macros/latex/contrib/tocbibind.zip)
md5sums=('e39588aa554f52691f821be66c4d1781')

build()
{
    cd $srcdir/tocbibind
    latex tocbibind.ins
}

package()
{
  mkdir -p $pkgdir/usr/share/texmf/tex/latex/tocbibind
  cp $srcdir/tocbibind/tocbibind.sty $pkgdir/usr/share/texmf/tex/latex/tocbibind
}
