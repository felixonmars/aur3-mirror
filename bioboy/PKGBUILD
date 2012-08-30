# Maintainer: dawn <crackofdusk@gmail.com>

pkgname=bioboy
pkgver=1.0
pkgrel=2
pkgdesc="A platformer... with a twist! "
arch=('i686' 'x86_64')
url="https://github.com/nddrylliog/bioboy"
license=('MIT')
depends=('gc' 'glib2' 'freealut' 'openal' 'libvorbis' 'sdl' 'cairo' 'librsvg' 'freetype2')
source=(https://github.com/downloads/nddrylliog/bioboy/bioboy-build.tar.bz2
        https://github.com/downloads/nddrylliog/bioboy/bioboy-assets.tar.bz2
        bioboy)
md5sums=('d50c222e38de0eeb04f57cc1f24081e5'
         'd60bcccb5c75ae213c1c7c2543e9365d'
         '21e72637f852f11f47ca1a4a39dadd9b')

build() {
    cd "$srcdir"/build
    CFLAGS="$(pkg-config --cflags --libs glib-2.0 cairo) -pthread" make
}

package() {
    mkdir -p "${pkgdir}/opt/bioboy"
    mkdir -p "${pkgdir}/usr/bin"

    cd "${srcdir}"
    cp -r build/bioboy assets config  "${pkgdir}/opt/bioboy"

    install -m755 -D "${startdir}/bioboy" "${pkgdir}/usr/bin/bioboy"
}
