# Maintainer: Julie Iaccarino <reiv3r@gmail.com>
# Contributor: Gustavo Sverzut Barbieri <barbieri@gmail.com>
# Contributor: Ronald van Haren <ronald@archlinux.org>

pkgname=evas-latest
_pkgname=evas
pkgver=1.7.6.1
pkgrel=1
pkgdesc='E17 Canvas and scenegraph rendering library.'
url='http://enlightenment.org/'
license=('LGPL2.1')
arch=('i686' 'x86_64')
options=('!emptydirs')
makedepends=('glibc')
depends=('eet' 'giflib' 'libpng' 'libjpeg>=7' 'libxrender' 'mesa'
  'fribidi' 'fontconfig' 'freetype2' 'harfbuzz')
provides=('evas=1.7.6')
conflicts=('evas')
source=("http://download.enlightenment.org/releases/${_pkgname}-${pkgver}.tar.gz")
md5sums=('c1710b7769c6dc8cfb0a21190fbc0c9b')

build() {
        cd "${srcdir}/${_pkgname}-${pkgver}"
        export CFLAGS="-fvisibility=hidden -ffunction-sections -fdata-sections ${CFLAGS}"
        export CXXFLAGS="-fvisibility=hidden -ffunction-sections -fdata-sections ${CXXFLAGS}"
        export LDFLAGS="-fvisibility=hidden -ffunction-sections -fdata-sections -Wl,--gc-sections -Wl,--as-needed  ${LDFLAGS}"

        ./configure \
    --prefix=/usr \
    --libexecdir=/usr/lib/evas \
    --enable-strict \
    --disable-static \
    --enable-fontconfig \
    --enable-fribidi \
    --enable-harfbuzz \
    --disable-pixman \
    --enable-buffer=static \
    --disable-gl-sdl \
    --enable-fb \
    --disable-directfb \
    --disable-wayland-shm \
    --disable-wayland-egl \
    --disable-sdl-primitive \
    --disable-software-xcb \
    --enable-software-xlib=static \
    --disable-gl-xcb \
    --enable-gl-xlib \
    --disable-image-loader-edb \
    --enable-image-loader-gif=static \
    --enable-image-loader-tiff=static \
    --enable-image-loader-svg=static \
    --enable-image-loader-eet=static \
    --enable-image-loader-generic=static \
    --disable-install-examples \
    --disable-tests \
    --disable-coverage \
    --disable-doc
        make
}

package() {
        cd "${srcdir}/${_pkgname}-${pkgver}"
        make DESTDIR="${pkgdir}" install

  # install license files
  install -Dm644 "$srcdir/${_pkgname}-$pkgver/COPYING" \
        "$pkgdir/usr/share/licenses/${_pkgname}/COPYING"
}


