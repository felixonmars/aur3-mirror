# Maintainer: Limao Luo <luolimao+AUR@gmail.com>

pkgname=imagemagick-q8
pkgver=6.8.6.9
pkgrel=1
pkgdesc="An image viewing/manipulation program (Q8 version can run 10% to 50% faster than the default Q16 version, and uses only half as much memory)."
arch=(i686 x86_64)
url=http://www.imagemagick.org/
provides=(imagemagick=$pkgver)
conflicts=(imagemagick)
license=(custom)
depends=(djvulibre fontconfig lcms2 liblqr libtool libwebp)
makedepends=(ghostscript jasper libpng librsvg libwmf libxml2 openexr)
optdepends=('ghostscript: for Ghostscript support'
    'imagemagick-doc: full documentation'
    'jasper: for JPEG-2000 support'
    'libjpeg-turbo: for jpeg support'
    'libpng: for PNG support'
    'librsvg: for SVG support'
    'libwmf: for WMF support'
    'libxml2: for XML support'
    'openexr: for OpenEXR support')
options=(!emptydirs libtool !makeflags)
source=(ftp://ftp.imagemagick.org/pub/ImageMagick/ImageMagick-${pkgver%.*}-${pkgver##*.}.tar.xz
    perlmagick.rpath.patch)
sha256sums=('6f072e1f577ef6bb6b32accca963e2513c6fe211ee352dfd6605de6a8e41f2ae'
    '3a60af7faab690a3eac58b5a68d9d3de12017440b8190303a466abf988853240')
sha512sums=('258d1b10558fb5dcf23ff0843d1aedf6e79694d85e3f50e2206e6d7c60db321e05a9a753523593595f849380617d570423d704e2656a2d57ef63435282880587'
    'd6d738ef5fdca0302b31292db737c03320638dacf5484b8c8b27c4334ae2b114b64c05cb12393d06ab2fac8e454295ed68c506a7e94689f25f5244c450813cc0')

prepare() {
    cd ImageMagick-${pkgver%.*}-${pkgver##*.}/
    patch -p1 -i ../perlmagick.rpath.patch
    sed -i 's|AC_PATH_XTRA||' configure.ac
}

build() {
    cd ImageMagick-${pkgver%.*}-${pkgver##*.}/
    autoreconf -fi
    ./configure \
        --prefix=/usr \
        --sysconfdir=/etc \
        --with-modules \
        --disable-static \
        --enable-openmp \
        --with-wmf \
        --with-openexr \
        --with-xml \
        --with-lcms2 \
        --with-jp2 \
        --with-gslib \
        --with-gs-font-dir=/usr/share/fonts/Type1 \
        --with-perl \
        --with-perl-options="INSTALLDIRS=vendor" \
        --without-gvc \
        --without-djvu \
        --without-autotrace \
        --without-webp \
        --without-jbig \
        --without-fpx \
        --without-dps \
        --without-fftw \
        --without-lqr \
	--with-quantum-depth=8
    make
}

package() {
    cd ImageMagick-${pkgver%.*}-${pkgver##*.}/
    make DESTDIR="$pkgdir" install
    install -d "$pkgdir"/usr/share/licenses/$pkgname/
    install -m644 LICENSE NOTICE "$pkgdir"/usr/share/licenses/$pkgname/
    rm -rf "$pkgdir"/usr/share/doc/
}
