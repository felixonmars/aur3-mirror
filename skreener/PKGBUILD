# Mantainer: Adrià Arrufat <swiftscythe@gmail.com>

pkgname=skreener
pkgver=0.1.1
pkgrel=1
pkgdesc="A screencast recording tool, primarily aimed at creating tutorials on how to use software. It’s closest proprietary analog is Wink."
arch=('i686' 'x86_64')
url="http://opendesktop.org/content/show.php?content=144765"
license=('GPL')
depends=('kdelibs')
makedepends=('cmake' 'automoc4')
source=(http://opendesktop.org/CONTENT/content-files/144765-${pkgname}-${pkgver}.tar.gz)
md5sums=('b03fab4d5390a778473304b899ae3c56')

build() {
    cd ${srcdir}/$pkgname-$pkgver/
    if [[ ! -d build ]]; then
	       mkdir build
	fi
    cd build
    cmake -DCMAKE_INSTALL_PREFIX=`kde4-config --prefix` -DCMAKE_BUILD_TYPE=release ../
    make  || return 1
    make DESTDIR=${startdir}/pkg/ install
}
