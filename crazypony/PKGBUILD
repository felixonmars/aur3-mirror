# Maintainer: zjn <zjn@quarkzil.ch>

pkgname=crazypony
pkgver=1.3.61.g6cfaa41
pkgrel=1
pkgdesc="A challenging old-school side-scrolling platformer with a fun and competitive multi-player aspect."
arch=('any')
url='https://twitter.com/verycrazypony'
license=('BSD')
depends=('enet' 'sfml' 'libjpeg-turbo' 'boost-libs')
makedepends=('git' 'premake' 'libpng' 'libvorbis' 'libogg' 'openal' 'freetype2' 'boost')
provides=('crazypony')

source=('git+https://bitbucket.org/crazypony/crazypony.git'
        'build_fix.patch')
md5sums=('SKIP'
         '620f5bb5c394c6e37916a518416824cf')

pkgver() {
    cd "$pkgname"
    git describe --tags | sed 's/^v//;s/-/./g'
}

build() {
    cd "$srcdir/$pkgname"
    patch -p1 < $srcdir/build_fix.patch
    premake4 gmake
    cd build
    make
}

package() {
    cd "$srcdir/$pkgname/output"

    mkdir -p "$pkgdir/opt/crazypony"
    cp -r . "$pkgdir/opt/crazypony"

    mkdir -p "$pkgdir/usr/bin"
    cat > "$pkgdir/usr/bin/crazypony" <<EOF
cd /opt/crazypony
./game_d
EOF
    chmod ugo+x "$pkgdir/usr/bin/crazypony"
}
