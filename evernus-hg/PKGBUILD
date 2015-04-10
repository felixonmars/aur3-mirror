# Maintainer: Kochetkov Andrey <gornet@gmail.com>

pkgname=evernus-hg
pkgver=r1165.c5db09af7869
pkgrel=1
pkgdesc="EVE Online trade tool"
arch=('i686' 'x86_64')
url="http://evernus.com/"
license=('GPL3')
depends=('qt5-base')
makedepends=('mercurial' 'clang' 'cmake' 'boost' 'libstdc++5')
provides=('evernus')
conflicts=('evernus')
options=()
install='evernus-hg.install'
backup=('usr/share/applications/evernus.desktop')
source=('hg+https://bitbucket.org/krojew/evernus' evernus.desktop evernus-hg.install)
md5sums=('SKIP'
         '7d6f7e723e53186a49e9f49c0362a3af'
         'f220a9fc62bf086fd519938075bd4197')

pkgver() {
  cd "evernus"
  printf "r%s.%s" "$(hg identify -n)" "$(hg identify -i)"
}

build() {
    cd "${srcdir}/evernus"
    CC=/usr/bin/clang CXX=/usr/bin/clang++ cmake -G "Unix Makefiles" \
        -DCMAKE_PREFIX_PATH=/usr/lib/cmake -DCMAKE_EXE_LINKER_FLAGS="-lm -lstdc++ -lc++ -lc++abi" \
        -DCMAKE_INSTALL_PREFIX="$pkgdir/usr/local" -DCMAKE_ABSOLUTE_DESTINATION_FILES="$pkgdir/usr/share/Evernus/res"
    make
}

package() {
    cd "${srcdir}/evernus"
    DESTDIR=$pkgdir make install
    install -d ${pkgdir}/usr/share/pixmaps
    install -d ${pkgdir}/usr/share/applications
    install -m 644 "${srcdir}"/evernus/images/main-icon.png "${pkgdir}"/usr/share/pixmaps/evernus.png
    install -m 644 "${srcdir}"/evernus.desktop "${pkgdir}"/usr/share/applications/evernus.desktop
}
