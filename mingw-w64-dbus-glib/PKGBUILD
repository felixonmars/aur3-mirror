# Maintainer: Xiao-Long Chen <chenxiaolong@cxl.epac.to>

pkgname=mingw-w64-dbus-glib
pkgver=0.102
pkgrel=1
pkgdesc="GLib bindings for DBUS (mingw-w64)"
arch=('any')
license=("GPL")
url="http://www.freedesktop.org/wiki/Software/DBusBindings"
depends=('mingw-w64-dbus' 'mingw-w64-glib2')
makedepends=('mingw-w64-gcc' 'mingw-w64-pkg-config' 'dbus-glib')
options=('!strip' '!buildflags' 'staticlibs')
source=("http://dbus.freedesktop.org/releases/dbus-glib/dbus-glib-${pkgver}.tar.gz")
sha512sums=('9bf4b33dd264eaed9ade0e35f0ad47986c31bd5e3de4d3e2fcee66a9be87000b6121bc810b9a5a24eca53190d98323b871dc78f341df8e05bd0247b096cf778f')

_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

build() {
  cd dbus-glib-${pkgver}

  export CFLAGS="-O2 -mms-bitfields"
  export CXXFLAGS="${CFLAGS}"
  unset LDFLAGS

  for _arch in ${_architectures}; do
    mkdir -p build-${_arch} && pushd build-${_arch}
    ../configure \
      --host=${_arch} \
      --target=${_arch} \
      --build=${CHOST} \
      --prefix=/usr/${_arch} \
      --enable-shared \
      --enable-static \
      --disable-bash-completion \
      --disable-abstract-sockets \
      --with-dbus-binding-tool=`which dbus-binding-tool`
    make
    popd
  done
}

package() {
  for _arch in ${_architectures}; do
    cd "${srcdir}/dbus-glib-${pkgver}/build-${_arch}"
    make DESTDIR="${pkgdir}" install
    find "${pkgdir}/usr/${_arch}" -name '*.exe' -o -name '*.bat' -o -name '*.def' -o -name '*.exp' | xargs -rtl1 rm
    find "${pkgdir}/usr/${_arch}" -name '*.dll' | xargs -rtl1 ${_arch}-strip --strip-unneeded
    find "${pkgdir}/usr/${_arch}" -name '*.a' -o -name '*.dll' | xargs -rtl1 ${_arch}-strip -g
    rm -rf "${pkgdir}/usr/${_arch}/"{etc,var,libexec,share}
  done
}
