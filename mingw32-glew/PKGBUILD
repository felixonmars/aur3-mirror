# Maintainer: Stefanos Carlström <jagot (at) tipota (dot) org>
pkgname=mingw32-glew
pkgver=1.10.0
pkgrel=2
pkgdesc="GLEW, The OpenGL Extension Wrangler Library (mingw32)"
arch=('any')
url="http://glew.sourceforge.net/"
license=('Modified BSD/MIT/GPL')
depends=('mingw32-runtime' 'mingw32-w32api')
makedepends=('mingw32-gcc' 'sed')
options=(!strip !buildflags)
source=(http://downloads.sourceforge.net/glew/glew-${pkgver}.tgz Makefile.patch Makefile.mingw.patch)
noextract=()
md5sums=('2f09e5e6cb1b9f3611bcac79bc9c2d5d'
         'f5ba9edd42a03854aff3f3e032412c05'
         '192a274440a8f5f817281149d33b61eb')

build() {
    cd "$srcdir/glew-$pkgver"

    unset LDFLAGS

    patch Makefile -i "$srcdir/Makefile.patch"
    patch config/Makefile.mingw -i "$srcdir/Makefile.mingw.patch"

    echo -e "#!/bin/sh\necho mingw" > config/config.guess

    GLEW_DEST=/usr/i486-mingw32/ AR=i486-mingw32-ar STRIP=i486-mingw32-strip make || return 1
}

package() {
    cd "$srcdir/glew-$pkgver"
    mkdir -p "$pkgdir/usr/i486-mingw32/lib/pkgconfig"
    GLEW_DEST="$pkgdir/usr/i486-mingw32" make install
}
