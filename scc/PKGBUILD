# Maintainer: Michał Maciej Różański <michal.rozanski@gmail.com>
pkgname=scc
pkgver=1.7.0.0
pkgrel=1
pkgdesc="Simple Chat Client is a lightweight and simple program which allows talking in the chat onet.pl without using a browser or java."
arch=('i686' 'x86_64')
url="http://simplechatclien.sourceforge.net/"
license=('GPL')
depends=('qt' 'qca' 'qca-ossl' 'phonon')
conflicts=('scc-git')
source=(http://switch.dl.sourceforge.net/project/simplechatclien/$pkgname-$pkgver.tar.gz)
md5sums=('c02532454c75b905dc4c4523a524e45d')

build() {
    cd "$srcdir/simplechatclient-1.7.0"
    cmake . && make
}
    
package() {
    cd "$srcdir/simplechatclient-1.7.0"
    make DESTDIR="$pkgdir/" install
}
