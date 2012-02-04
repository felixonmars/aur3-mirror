# Maintainer: Clément DEMOULINS <clement@archivel.fr>

pkgname=texmakerx
pkgver=2.1
pkgrel=2
pkgdesc="Fork of the LaTeX IDE TexMaker. Gives you an environment where you can easily create and manage LaTeX documents."
arch=('i686' 'x86_64')
url="http://texmakerx.sourceforge.net/"
license=('GPL')
depends=('poppler-qt')

source=(http://downloads.sourceforge.net/project/texstudio/texmakerx/TexMakerX%20${pkgver}/${pkgname}-${pkgver}.tar.gz)
md5sums=('9f24b3327831ef85da74b7a0d627bafb')

build() {
    cd $srcdir/${pkgname}${pkgver}
    qmake texmakerx.pro
    make
    make install INSTALL_ROOT="$pkgdir"
}
