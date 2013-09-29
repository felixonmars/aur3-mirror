# Maintainer: Limao Luo <luolimao+AUR@gmail.com>

pkgname=ibus-qt-git
pkgver=1.3.2.3.gec5d309
pkgrel=1
pkgdesc="It includes ibus qt library and ibus qt input method plugin"
arch=(i686 x86_64)
url=http://ibus.googlecode.com
license=(LGPL2.1)
depends=(ibus icu qt4)
makedepends=(cmake doxygen git)
provides=(${pkgname%-*}=$pkgver)
conflicts=(${pkgname%-*})
install=$pkgname.install
source=($pkgname::git://github.com/ibus/${pkgname%-*}.git)
sha256sums=('SKIP')
sha512sums=('SKIP')

pkgver() {
    cd $pkgname/
    git describe --tags | sed 's/-/./g'
}

build() {
    install -d build/
    cd build/
    cmake ../$pkgname/ \
        -DCMAKE_INSTALL_PREFIX=$(kde4-config --prefix) \
        -DCMAKE_BUILD_TYPE=Release \
        -DCMAKE_CXX_FLAGS="-Wall" \
        -DQT_QMAKE_EXECUTABLE=qmake-qt4
    make VERBOSE=1
}

package() {
    make -C build DESTDIR="$pkgdir" install
}
