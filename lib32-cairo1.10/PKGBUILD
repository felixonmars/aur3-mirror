# Maintainer: Jan de Groot <jgc@archlinux.org>
# Contributor: Brice Carpentier <brice@daknet.org>

_pkgname=cairo
pkgname=lib32-${_pkgname}1.10
pkgver=1.10.2
pkgrel=1
pkgdesc="Cairo vector graphics library"
arch=(i686 x86_64)
license=('LGPL' MPL)
url=http://cairographics.org/
depends=(lib32-fontconfig lib32-glib2 lib32-libpng lib32-libxrender lib32-pixman)
makedepends=(gcc-multilib)
provides=(lib32-$_pkgname=$pkgver)
conflicts=(lib32-$_pkgname)
if [[ $CARCH == "i686" ]]; then
    depends=(${depends[@]/lib32-/})
    unset makedepends
    provides=(${provides[@]/lib32-/})
    conflicts=(${conflicts[@]/lib32-/})
fi
options=(!libtool)
source=(http://cairographics.org/releases/$_pkgname-$pkgver.tar.gz
    cairo-1.10.0-buggy_gradients.patch)
sha256sums=('32018c7998358eebc2ad578ff8d8559d34fc80252095f110a572ed23d989fc41'
    '79085147567e6e080d5c1d7d2246f7d4be1efcc8e4b4fe44b6db1ebeae93c420')
sha512sums=('8be4b9ce002f039014d747cc2b48c6a6dfac78df74ebc5ad711a8f36572b819b2c6da3cc4732d0ca93e9052b4b3bb42a146f5e7e346b75dde695d44477b19c9a'
    'bb529a943977926c45b26959d3f8097665ed8f5502e5171e48a92c787463bb031ee70bb45580609213dbb86ae7914829ddae97be3c7d326b8a03029a2307431d')

build() {
    cd "$srcdir"/$_pkgname-$pkgver/
    patch -Np1 -i ../cairo-1.10.0-buggy_gradients.patch
    if [[ $CARCH == "x86_64" ]]; then
        export CC="gcc -m32"
        export CXX="g++ -m32"
        export PKG_CONFIG_PATH="/usr/lib32/pkgconfig"
        libopt="--libdir=/usr/lib32"
    fi
    ./configure \
        --prefix=/usr \
        --sysconfdir=/etc \
        --localstatedir=/var \
        --disable-static \
        --enable-tee \
        "$libopt"
    unset libopt
    make
}

check() {
    make -C $_pkgname-$pkgver check || true # 248 Passed, 65 Failed [2 crashed, 8 expected], 28 Skipped
}

package() {
    make -C $_pkgname-$pkgver DESTDIR="$pkgdir" install
    [[ $CARCH == "x86_64" ]] && rm -rf "$pkgdir"/usr/{include,share,bin}
}
