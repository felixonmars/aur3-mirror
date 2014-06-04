# Maintainer: Henry de Valence <hdevalence@hdevalence.ca>
pkgname=libstxxl
pkgver=1.4.0
pkgrel=1
pkgdesc="Standard Template Library for Extra Large Data Sets"
arch=('i686' 'x86_64')
url="http://stxxl.sourceforge.net/"
license=('custom:Boost')
depends=('gcc-libs-multilib')
source=("http://downloads.sourceforge.net/project/stxxl/stxxl/1.4.0/stxxl-1.4.0.tar.gz")
md5sums=('4d2d9d46e80b71345e1bd78388044997')

build() {
	cd "$srcdir/stxxl-$pkgver"
    mkdir -p build
    cd build
    cmake .. -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_BUILD_TYPE=Release -DBUILD_SHARED_LIBS=ON -DBUILD_STATIC_LIBS=ON
	make
}

package() {
	cd "$srcdir/stxxl-$pkgver/build"
	make DESTDIR="$pkgdir/" install
    mkdir -p "$pkgdir/usr/share/licenses/$pkgname"
    cp ../LICENSE_1_0.txt "$pkgdir/usr/share/licenses/$pkgname/"
}
