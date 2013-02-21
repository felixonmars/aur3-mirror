# Maintainer: Emil Kverndal <Kverndal@gmail.com>
pkgname=cockatrice
pkgver=20120702
pkgrel=1
pkgdesc="A platform for playing card games, such as Magic: The Gathering."
arch=('i686' 'x86_64')
url="http://www.cockatrice.de"
license=('GPL')
depends=('protobuf' 'qt' 'gcc-libs-multilib')
makedepends=('cmake')
conflicts=('cockatrice-git')
source=(${url}/files/${pkgname}_source_${pkgver}.tar.gz)
md5sums=(16256b85d03e723281a2e6f989f78c46)

build() {
    cd $srcdir/${pkgname}_$pkgver

    echo "TARGET_LINK_LIBRARIES(cockatrice pthread)" >> cockatrice/CMakeLists.txt

    mkdir build && cd build
    cmake .. \
        -DCMAKE_INSTALL_PREFIX=/usr/
    make
}

package() {
    cd "$srcdir/${pkgname}_$pkgver"
    cd build
    make DESTDIR="$pkgdir/" install
}
