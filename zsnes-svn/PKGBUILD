# Maintainer: Limao Luo <luolimao+AUR@gmail.com>
# Contributor: rabyte <rabyte__gmail>
# Contributor: Lex Black <autumn-wind@web.de>

pkgname=zsnes-svn
pkgver=1.52.5224
pkgrel=1
pkgdesc="A Super Nintendo emulator"
arch=(i686 x86_64)
url=http://www.zsnes.com/
license=(GPL2)
depends=(lib32-gcc-libs lib32-libao lib32-libgl lib32-libpng lib32-ncurses lib32-sdl qt4)
optdepends=('lib32-alsa-lib: sound support')
makedepends=(gcc-multilib gendesk mesa nasm subversion)
if [[ $CARCH == "i686" ]]; then
    depends=(${depends[@]/lib32-/})
    optdepends=(${optdepends[@]/lib32-/})
    makedepends=(${makedepends[@]/multilib-/})
fi
provides=(${pkgname%-*}=$pkgver)
conflicts=(${pkgname%-*}{,-wip})
options=(!buildflags !makeflags)
source=($pkgname::svn+http://svn.bountysource.com/${pkgname%-*}/trunk/
    path_error.patch
    $pkgname.patch
    $pkgname-1.51-libpng15.patch)
sha256sums=('SKIP'
    'afca5aa8bdff91a734926801a3827798ac764eb6fb1cd5dcd90392dc77f3cd1c'
    'fe35e4e6a4688bbeefb9168af8f6ac8e2d91e2ddff7f93821ed9e6544e529340'
    '4825cb7f3fa158ebf5ea5a6f1ba2a0b6bab0b05adea675dc1edb86230137fc4e')
sha512sums=('SKIP'
    'ea1f39dd05d76af85a22a62e160efb2f4c934eb36558b9ec7bbf0d0d43145871abfb73a2a4e4555e9634a365aa0f8b647657de9643b55e4882115a806cb37ffa'
    '0cc1f19e0d1052a7c3384fabb800e38565a0a79fabd14556f890eda88a3ccecd786871d4bf7e8fa44710a3e950d780f32d942e8976ca9cd624c991c269f6e123'
    'dc97bc8b85c9596a9efa3716ecf797d7924763528f1a902f5f6e0ca527e9edef5b6c32ef013e870a80daf81ec81747c00eb0e7f97f714ee695afbc82fd57a9e4')

pkgver() {
    echo $(grep -o 'VERSION=[0-9.]\+' $pkgname/src/configure.in | tr -d 'A-Z=').$(svnversion "$SRCDEST"/$pkgname/ | tr -d 'a-zA-z')
}

prepare() {
    cd $pkgname/src/
    patch -p1 -i ../../path_error.patch
    patch -p1 -i ../../$pkgname.patch
    patch -p1 -i ../../$pkgname-1.51-libpng15.patch
    sed -i 's:AM_CHECK_QT()::' configure.in
    sed -ri 's:(moc|uic)\b:&-qt4:' Makefile.in
}

build() {
    cd $pkgname/src/
    if [[ $CARCH == "x86_64" ]]; then
        export CC="gcc -m32 -march=i686"
        export CXX="g++ -m32 -march=i686"
        export PKG_CONFIG_PATH="/usr/lib32/pkgconfig"
    fi
    autoreconf -fi
    ./configure \
        --prefix=/usr \
        --enable-libao \
        --enable-release \
        --target=i686-unknown-linux-gnu \
        with_libpng=yes \
        x_libraries=/usr/lib
    make
}

package() {
    gendesk

    cd $pkgname/src/
    make DESTDIR="$pkgdir" install

    install -Dm644 icons/48x48x32.png $pkgdir/usr/share/pixmaps/zsnes.png
    desktop-file-install linux/zsnes.desktop --dir "$pkgdir"/usr/share/applications/

    mv "$pkgdir"/usr/{man,share}
}
