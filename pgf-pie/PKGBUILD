# Contributor: Rodrigo Fernandes <cyber_fusion@gmx.net>

pkgname=pgf-pie
pkgver=0.2.1
pkgrel=1
pkgdesc="Some LaTeX macros for pie chart by using PGF/Tikz package"
arch=("any")
license=('mit')
url="http://code.google.com/p/pgf-pie/"
depends=('texlive-core' 'texlive-latexextra' 'texlive-science')
source=("http://pgf-pie.googlecode.com/files/${pkgname}-${pkgver}.zip")
sha1sums=('dc2ba80299c3d72166483eeb52ff868287f560b0')
install="pgf-pie.install"

build()
{
        mkdir -p $pkgdir/usr/share/texmf/tex/latex/${pkgname}
        cp $srcdir/${pkgname}-${pkgver}/${pkgname}.sty $pkgdir/usr/share/texmf/tex/latex/${pkgname}
}
