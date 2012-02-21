# Maintainer: Simone Sclavi 'Ito' <darkhado@gmail.com>
pkgname=supertombola
pkgver=2.5_01_beta
pkgrel=1
pkgdesc="QT program for "Tombola" italian game." 
arch=('i686' 'x86_64')
url="http://supertombola.sourceforge.net/"
license=('GPL')
depends=('qt')
source=(http://garr.dl.sourceforge.net/project/${pkgname}/Supertombola_2.5_beta/${pkgname}_qt_${pkgver}.tar.gz)
md5sums=('797a25ad97aea913b530f3f45d96f0ee')

build() {
    cd $pkgname
    qmake supertombola.pro
    make
}

package() {
    cd $pkgname
    install -Dm755 $pkgname $pkgdir/usr/bin/$pkgname
}
