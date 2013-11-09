# Maintainer: Thomas Sowell <tom@fancydriving.org>

buildarch=1

pkgname=chromiumos-libbase
pkgdesc="Common shared library code for Chromium OS"
pkgver=R30.4537
pkgrel=1
arch=('any')
groups=('chromarchy')
url="https://src.chromium.org/chrome/trunk/src/base"
license=('custom:chromium')
_svnname='base'
_basever=180609
depends=('glib' 'libevent' 'gtest')
makedepends=('git' 'subversion' 'scons' 'chromiumos-overlay')

source=(base-pkgconfig.patch
        base-noclangflags.patch
        LICENSE
        "$_svnname::svn+https://src.chromium.org/chrome/trunk/src/base#revision=180609")

md5sums=('c4cfdbe52d944052dd26337a24f7a222'
         'a3395fd9ec84c2ee6013cb18e735acfc'
         'd2d164565cc10f298390174d9cb6d18d'
         'SKIP')

prepare() {
  mkdir -p "$srcdir/build"
  cd "$srcdir/build"
  cp "/usr/share/chromiumos-overlay/chromeos-base/libchrome/files/build_config.h-180609" build_config.h

  local _libchromepatchdir="/usr/share/chromiumos-overlay/chromeos-base/libchrome/files"

  cd "$srcdir/$_svnname"
  cp "$_libchromepatchdir/SConstruct-180609" SConstruct

  patch -Np1 -i ${srcdir}/base-pkgconfig.patch
  patch -Np1 -i ${srcdir}/base-noclangflags.patch
  patch -Np3 -i ${_libchromepatchdir}/gtest_include_path_fixup.patch
  patch -Np1 -i ${_libchromepatchdir}/base-125070-no-X.patch
  patch -Np1 -i ${_libchromepatchdir}/base-125070-x32.patch

  mkdir -p third_party/libevent
  echo '#include <event.h>' > third_party/libevent/event.h
}

build() {
  cd "$srcdir/$_svnname"

  BASE_VER=$_basever CCFLAGS="-Wno-error=unused-local-typedefs" scons
}

package() {
  cd "$srcdir/$_svnname"

  install -m 644 -D libchrome-${_basever}.pc ${pkgdir}/usr/lib/pkgconfig/libchrome-${_basever}.pc
  for I in libbase*-${_basever}.so; do
    install -m 755 -D ${I} ${pkgdir}/usr/lib/${I}
  done
  local _header_dirs=(
    third_party/icu
    third_party/nspr
    third_party/valgrind
    third_party/dynamic_annotations
    .
    debug
    files
    json
    memory
    metrics
    posix
    strings
    synchronization
    threading
  )
  for d in "${_header_dirs[@]}"; do
    install -m 755 -d ${pkgdir}/usr/include/base-${_basever}/base/${d}
    install -m 644 ${d}/*.h ${pkgdir}/usr/include/base-${_basever}/base/${d}
  done

  install -m 644 -D ${srcdir}/build/build_config.h ${pkgdir}/usr/include/base-${_basever}/build/build_config.h

  install -m 644 -D ${srcdir}/LICENSE ${pkgdir}/usr/share/license/${pkgname}/LICENSE
}
