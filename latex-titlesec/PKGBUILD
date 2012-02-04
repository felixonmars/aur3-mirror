# Contributor: Arthur Darcet <arthur dot darcet at m4x dot org>
pkgname=latex-titlesec
pkgver=20080718
pkgrel=3
pkgdesc="Select alternative section titles."
arch=('i686' 'x86_64')
url="http://tug.ctan.org/tex-archive/macros/latex/contrib/titlesec/"
license=('custom')
depends=('texlive-core')
makedepends=('unzip')
conflicts=(texlive-latexextra)
install=latex-titlesec.install
source=(http://mirror.ctan.org/macros/latex/contrib/titlesec.zip)
md5sums=('7c70cb7d225ca42d726dbd94d509f0e6')

build() {
    mkdir -p $startdir/pkg/usr/share/texmf-dist/tex/latex/titlesec
    install -D $startdir/src/titlesec/* $startdir/pkg/usr/share/texmf-dist/tex/latex/titlesec/
}
