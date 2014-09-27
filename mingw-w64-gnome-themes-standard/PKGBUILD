pkgname=mingw-w64-gnome-themes-standard
pkgver=3.14.0
pkgrel=1
pkgdesc="Default themes for the GNOME desktop (mingw-w64)"
arch=(any)
url="http://www.gnome.org"
license=(GPL2)

depends=(mingw-w64-librsvg)
makedepends=('mingw-w64-gtk3>=3.14.0' 'mingw-w64-gtk2>=2.24.15' librsvg gdk-pixbuf2 intltool)

source=(
  "http://ftp.gnome.org/pub/gnome/sources/gnome-themes-standard/${pkgver%.*}/gnome-themes-standard-${pkgver}.tar.xz")

sha256sums=('addd469f4ba746f8ebb03da8b5c67b7d8b6b2c979f7f07958455c7e33fbdbe09')

_architectures="i686-w64-mingw32 x86_64-w64-mingw32"


build() {
  cd "${srcdir}/gnome-themes-standard-${pkgver}"

  for _arch in ${_architectures}; do
    unset LDFLAGS
    export CFLAGS="-O2 -mms-bitfields"
    mkdir -p "${srcdir}/${pkgname}-${pkgver}-build-${_arch}"
    cd "${srcdir}/${pkgname}-${pkgver}-build-${_arch}"
    msg "Starting configure and make"
    ${srcdir}/gnome-themes-standard-${pkgver}/configure \
      --prefix=/usr/${_arch} \
      --build=$CHOST \
      --host=${_arch} \
      --disable-nls
    make
  done
}


package() {
  for _arch in ${_architectures}; do
    cd "${srcdir}/${pkgname}-${pkgver}-build-${_arch}"
    make -j1 DESTDIR="$pkgdir" install

    # stuff useless for MS Windows
    rm -r "$pkgdir/usr/$_arch/share/themes/Adwaita/metacity-1"
    rm -r "$pkgdir/usr/$_arch/share/themes/HighContrast/metacity-1"
  done
}
