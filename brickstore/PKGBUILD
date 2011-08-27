# Contributor: Jaroslav Jiricka <giahra@atlas.cz>
pkgname=brickstore
pkgver=1.1.7
pkgrel=1
pkgdesc="An offline tool to manage your online store on http://www.bricklink.com"
depends=('qsa' 'curl')
source=("http://brickforge.de/software/$pkgname/source/$pkgname-$pkgver.tar.bz2")
url="http://brickforge.de/"
license="GPL"
md5sums=('7f5967e736e87cb0eadeb3518426f1db')

build() {
  cd $startdir/src/$pkgname-$pkgver
  sed -i '/INCLUDEPATH += qsa\/src\/qsa/s/^/#/' brickstore.pro
  sed -i '/LIBS += qsa\/src\/qsa\/libqsa.a/s/=/= -lqsa #/' brickstore.pro
  qmake PREFIX=/usr
  make || return 1
  make install INSTALL_ROOT=$startdir/pkg
}
