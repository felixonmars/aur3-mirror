# Maintainer: Pierre Chiche <pierre dot chiche at gmail dot com>
pkgname=lastwave
pkgver=3.1
pkgrel=2
pkgdesc="The signal processing command language."
arch=('i686' 'x86_64')
url="http://www.cmap.polytechnique.fr/~bacry/LastWave/"
license=('unknown')
depends=('wxgtk')
makedepends=('wxgtk')
source=('http://www.cmap.polytechnique.fr/~bacry/LastWave/download1.php?file=LastWave_3_1.unix.zip&type=x-zip&computer=unix'
        'wxsystem.patch'
        'image_file.patch')
md5sums=('0edd733971ab3224815fb0174009c278'
         '2c58c72f53ff8199ded91ef2f0e2688b'
         '4613a11c57602e36a6557150fb43687f')

build() {
    sed 's|$(ARCH)|linux|g' -i ${srcdir}/LastWave_3_1/LastWave/Makefiles/Makefile
    sed 's|$(ARCH)|linux|g' -i ${srcdir}/LastWave_3_1/LastWave/Makefiles/GenericUnixMakefile
    sed 's|$(ARCH)|linux|g' -i ${srcdir}/LastWave_3_1/LastWave/Makefiles/MakeDefs.linux
    sed 's|$(LWPATH)|'"${srcdir}"'/LastWave_3_1/LastWave|g' -i ${srcdir}/LastWave_3_1/LastWave/Makefiles/Makefile
    sed 's|$(LWPATH)|'"${srcdir}"'/LastWave_3_1/LastWave|g' -i ${srcdir}/LastWave_3_1/LastWave/Makefiles/GenericUnixMakefile
    sed 's|$(LWPATH)|'"${srcdir}"'/LastWave_3_1/LastWave|g' -i ${srcdir}/LastWave_3_1/LastWave/Makefiles/MakeDefs.linux
    
    cd "${srcdir}/LastWave_3_1/"
    patch -p1 < ${srcdir}/wxsystem.patch
    patch -p1 < ${srcdir}/image_file.patch
    
    cd "${srcdir}/LastWave_3_1/LastWave/Makefiles/"
    make dirs || return 1
    make makes || return 1
    make || return 1
    install -D -m 755 ${srcdir}/LastWave_3_1/LastWave/bin/linux/lw ${pkgdir}/usr/bin/lastwave
    install -d ${pkgdir}/usr/share/lastwave
    cp -r ${srcdir}/LastWave_3_1/scripts ${pkgdir}/usr/share/lastwave
    msg "You will have to specify /usr/share/lastwave/scripts as the scripts directory on first use."
}
