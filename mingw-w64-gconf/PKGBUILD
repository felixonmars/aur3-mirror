# Maintainer: Xiao-Long Chen <chenxiaolong@cxl.epac.to>

pkgname=mingw-w64-gconf
pkgver=3.2.6
pkgrel=1
pkgdesc="A configuration database system (mingw-w64)"
arch=('any')
url="http://www.gtk.org"
license=("LGPL")
makedepends=('mingw-w64-configure' 'glib2' 'intltool' 'gnome-common' 'gobject-introspection' 'gtk-doc')
depends=('mingw-w64-'{dbus-glib,libxml2,gtk3})
options=('!strip' '!buildflags' 'staticlibs')
source=("http://ftp.gnome.org/pub/gnome/sources/GConf/${pkgver%.*}/GConf-${pkgver}.tar.xz")

md5sums=('2b16996d0e4b112856ee5c59130e822c')

_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

build() {
  cd "${srcdir}/GConf-${pkgver}"

  autoreconf --install --force

  export CFLAGS="-O2 -mms-bitfields"
  export CXXFLAGS="${CFLAGS}"
  unset LDFLAGS

  for _arch in ${_architectures}; do
    mkdir -p build-${_arch} && pushd build-${_arch}
    ${_arch}-configure \
      --without-openldap --disable-defaults-service \
      --with-gtk=3.0 --disable-orbit
    make
    popd
  done
}

package() {
  for _arch in ${_architectures}; do
    cd "${srcdir}/GConf-${pkgver}/build-${_arch}"
    make -j1 DESTDIR="$pkgdir" install
    find "$pkgdir/usr/${_arch}" -name '*.exe' -o -name '*.bat' -o -name '*.def' -o -name '*.exp' -o -name '*.manifest' | xargs -rtl1 rm
    find "$pkgdir/usr/${_arch}" -name '*.dll' | xargs -rtl1 ${_arch}-strip -x
    find "$pkgdir/usr/${_arch}" -name '*.a' -o -name '*.dll' | xargs -rtl1 ${_arch}-strip -g
    rm -r "$pkgdir/usr/${_arch}/etc/xdg/"
    rm -r "$pkgdir/usr/${_arch}/share/man/"
  done
}
