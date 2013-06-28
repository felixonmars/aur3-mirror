# Maintainer: Limao Luo <luolimao+AUR@gmail.com>
# Contrubutor: Lisa Denia <eiffel56@gmail.com>

pkgname=qt2
pkgver=2.3.2
pkgrel=6
pkgdesc="QT Toolkit"
arch=(i686 x86_64)
license=(GPL2 QPL)
url=http://qt-project.org/
groups=(base-devel)
depends=(libjpeg-turbo libsm libxft libxext)
makedepends=('gcc>=4.7.0')
install=$pkgname.install
source=(http://download.qt-project.org/archive/qt/2/qt-x11-$pkgver.tar.gz
    env.sh)
sha256sums=('0d7511c3a055f6ed89e6606bafa52510b9da33e96db1d2086642c49aea46b9fa'
    '36989b52e3e488f748d818ddea0c6f4b1ecf64f80e1a672376ee701d22f660e0')
sha512sums=('f0a9e53c71c636234558b773feb65738bac14decdaa818053e9f2683a32af81e2b0e345c68f6dd9a4a695f54152700f4a97bacf20e2876c0cdc1e5c790a1eb57'
    '8fea53e585f66302c8c0465aa1283f1f1bdce74c619a87dd4fdd89a53b07cf544a98d14ae9504fb3623dcef8a7e2b9df670445d1db3d253d4c4c883d72deb00e')

prepare() {
    # GCC 4.7 fix
    sed -i -e 's:append:this->&:' -e 's:remove( this->fromLast():this->&:'  qt-$pkgver/src/tools/qvaluestack.h
}

build() {
    unset LD_PRELOAD
    export QTDIR="$srcdir/qt-$pkgver"
    export KDEDIR="/opt/kde2/"
    export LD_LIBRARY_PATH="$QTDIR/lib/:$KDEDIR/lib/"
    PATH="$QTDIR/bin/:$KDEDIR/bin/:$PATH"

    ./configure $(pkg-config --cflags-only-I freetype2) -sm -gif -system-jpeg -no-opengl
    make
}

package() {
    cd qt-$pkgver/
    install -Dm755 ../env.sh "$pkgdir"/opt/$pkgname/env.sh
    install -Dm644 LICENSE.QPL "$pkgdir"/usr/share/licenses/$pkgname/LICENSE.QPL
    cp -rL include/ lib/ bin/ "$pkgdir"/opt/$pkgname/
}
