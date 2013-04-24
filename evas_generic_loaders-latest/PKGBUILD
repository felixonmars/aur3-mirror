# Maintainer: Julie Iaccarino <reiv3r@gmail.com>
# Contributor: Gustavo Sverzut Barbieri <barbieri@gmail.com>
# Contributor: Ronald van Haren <ronald@archlinux.org>


pkgname=evas_generic_loaders-latest
_pkgname=evas_generic_loaders
pkgver=1.7.6
pkgrel=1
pkgdesc='E17 Extra loaders for GPL loaders and unstable libraries.'
url='http://enlightenment.org/'
license=('LGPL2.1')
arch=('i686' 'x86_64')
options=('!emptydirs')
makedepends=('glibc')
depends=('librsvg' 'gstreamer0.10-base' 'poppler' 'libraw' 'libspectre' 'eina' 'evas')
provides=('evas_generic_loaders=1.7.6')
conflicts=('evas_generic_loaders')
source=("http://download.enlightenment.org/releases/${_pkgname}-${pkgver}.tar.gz")
md5sums=('f025e08a673ba4f11a3d17fc50e0abb1')

build() {
        cd "${srcdir}/${_pkgname}-${pkgver}"

  export CFLAGS="-fvisibility=hidden -ffunction-sections -fdata-sections ${CFLAGS}"
  export CXXFLAGS="-fvisibility=hidden -ffunction-sections -fdata-sections ${CXXFLAGS}"
  export LDFLAGS="-fvisibility=hidden -ffunction-sections -fdata-sections -Wl,--gc-sections -Wl,--as-needed  ${LDFLAGS}"

        ./configure \
    --prefix=/usr \
    --libexecdir=/usr/lib/evas \
    --enable-poppler \
    --enable-spectre \
    --enable-libraw \
    --enable-svg \
    --enable-gstreamer \
    --disable-static

        make
}

package() {
        cd "${srcdir}/${_pkgname}-${pkgver}"
        make DESTDIR="${pkgdir}" install

  # install license files
  install -Dm644 "$srcdir/$_pkgname-$pkgver/COPYING" \
        "$pkgdir/usr/share/licenses/$_pkgname/COPYING"
}


