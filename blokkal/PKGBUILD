# Contributor: Nassim Kacha <nassim.kacha@gmail.com>
pkgname=blokkal
pkgver=0.1.2
pkgrel=1
pkgdesc="A KDE Blogging Client for multiple APIs"
arch=("i686" "x86_64")
url="http://blokkal.sourceforge.net/"
license=('GPL2')
install=('blokkal.install')
depends=('kdepimlibs' 'kdelibs')
makedepends=('cmake' 'automoc4')
source=(http://freefr.dl.sourceforge.net/project/$pkgname/$pkgname/$pkgver/Blokkal-$pkgver.tar.bz2)
md5sums=('3b84066d0f7ef83cbffd41a74a2f09ce')
build() {
        cd ${srcdir}/Blokkal-${pkgver}
	cmake -DCMAKE_INSTALL_PREFIX=/usr .
	make || return 1
	make DESTDIR=$pkgdir install
}

 
