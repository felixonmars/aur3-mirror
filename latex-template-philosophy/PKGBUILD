# Maintainer: arbn <austin.rbsn@gmail.com@gmail.com> irc: arbn at
# freenode
# Last edited: 23 October 2011

pkgname=latex-template-philosophy
pkgver=200703
pkgrel=1
license=('')
depends=('texlive-core')
optdepends=('latex-template-springer')
pkgdesc="A LaTeX template for philosophical papers."
url="http://gregorywheeler.org/latex/phil-style1.html"
arch=('any')
install=texlive.install
source=(http://gregorywheeler.org/latex/philosophy.sty)
md5sums=('1fc2d8f767b4d848e71b428f0a7183ee')

build()
{
    mkdir -p $pkgdir/usr/share/texmf/tex/latex/philosophy
    cp $srcdir/philosophy.sty $pkgdir/usr/share/texmf/tex/latex/philosophy
}
