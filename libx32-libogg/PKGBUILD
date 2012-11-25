# $Id: PKGBUILD 78782 2012-10-24 15:17:40Z arodseth $
# Upstream Maintainer: Jan "heftig" Steffens <jan.steffens@gmail.com>
# Maintainer: Fantix King <fantix.king at gmail.com>

_pkgbasename=libogg
pkgname=libx32-$_pkgbasename
pkgver=1.3.0
pkgrel=1.2
pkgdesc='Ogg bitstream and framing library (x32 ABI)'
arch=('x86_64')
url="http://www.xiph.org/ogg/"
license=('BSD')
depends=('libx32-glibc' $_pkgbasename)
makedepends=(gcc-multilib-x32)
options=('!libtool')
source=(
    "http://downloads.xiph.org/releases/ogg/$_pkgbasename-$pkgver.tar.gz"
    'config_types-stub.h'
)
md5sums=('0a7eb40b86ac050db3a789ab65fe21c2'
         'f670b4d9dbf79f394f822f6ff30f512d')

build() {
    export CC="gcc -mx32"
    export CXX="g++ -mx32"
    export PKG_CONFIG_PATH="/usr/libx32/pkgconfig"

    cd $srcdir/${_pkgbasename}-${pkgver}
    ./configure --prefix=/usr --libdir=/usr/libx32
    make
}

package() {
    install="${pkgname}.install"

    cd $srcdir/${_pkgbasename}-${pkgver}

    make DESTDIR=$pkgdir install

    rm -rf "$pkgdir"/usr/{share,bin}
    find "$pkgdir"/usr/include/ogg -type f -not -name config_types.h -delete
    mv "$pkgdir"/usr/include/ogg/config_types{,-x32}.h
    install -Dm644 "${srcdir}/config_types-stub.h" "${pkgdir}/usr/include/ogg/config_types-stub.h"
    mkdir -p "$pkgdir/usr/share/licenses"
    ln -s $_pkgbasename "$pkgdir/usr/share/licenses/$pkgname"
}
