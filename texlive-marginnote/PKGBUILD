# Original autor: Anselmo L. S. Melo <anselmolsm@gmail.com>
# Maintainer: Anselmo L. S. Melo  <anselmolsm@gmail.com>    irc: anselmolsm at freenode.org
# Last edited: 6th May 2015

pkgname=texlive-marginnote
pkgver=1.1i
pkgrel=1
license=('GPL')
depends=('texlive-core')
builddeps=('zip')
pkgdesc="This package provides the command \margin note that may be used instead of \marginpar at almost every place where \marginpar cannot be used, e.g., inside floats, footnotes, or in frames made with the framed package."
url="http://www.ctan.org/tex-archive/macros/latex/contrib/marginnote"
arch=('any')
install=texlive-marginnote.install
source=(http://mirrors.ctan.org/install/macros/latex/contrib/marginnote.tds.zip)
md5sums=('1b87429f2a389b23cb9cd99e169b12b0')

package()
{
      mkdir -p $pkgdir/usr/share/texmf-dist/tex/latex/marginnote/
      cp $srcdir/tex/latex/marginnote/marginnote.sty $pkgdir/usr/share/texmf-dist/tex/latex/marginnote/
}
