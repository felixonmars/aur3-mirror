# Maintainer: David Roheim <david dot roheim at gmail dot com>
# Contributor: Arthur Darcet <arthur.darcet at m4x.org>
# Contributor: Techlive Zheng <techlivezheng at gmail.com>

_pkgbasename=libiconv
pkgname=lib32-$_pkgbasename
pkgver=1.14
pkgrel=1
pkgdesc='Provides GNU libiconv.so and libcharset.so (32-bit).'
arch=('x86_64')
url='http://www.gnu.org/software/libiconv/'
license=('LGPL')
source=("http://ftp.gnu.org/pub/gnu/${pkgname}/${_pkgbasename}-${pkgver}.tar.gz")
sha256sums=('72b24ded17d687193c3366d0ebe7cde1e6b18f0df8c55438ac95be39e8a30613')
options=(!libtool)

build() {
  cd $srcdir/${_pkgbasename}-${pkgver}
  sed '/LD_RUN_PATH/d' -i Makefile.in
  CC=$(which clang)
  CXX=$(which clang++)
  TARGET=i686-pc-linux-gnu
  CFLAGS="-target $TARGET -m32"
  CXXFLAGS="-target $TARGET -m32"
  LDFLAGS=-L/usr/lib32
  ./configure --prefix=/usr
  cp -f /usr/include/stdio.h srclib/stdio.in.h
  make -j
}

package() {
  cd ${srcdir}/${_pkgbasename}-${pkgver}

  umask 022
  install -Dm755 ./lib/.libs/libiconv.so.2.5.1 ${pkgdir}/usr/lib32/libiconv.so.2.5.1
  ln ${pkgdir}/usr/lib32/libiconv.so.2.5.1 ${pkgdir}/usr/lib32/libiconv.so.2
  ln ${pkgdir}/usr/lib32/libiconv.so.2.5.1 ${pkgdir}/usr/lib32/libiconv.so
  install -Dm755 ./lib/libcharset.so.1.0.0 ${pkgdir}/usr/lib32/libcharset.so.1.0.0
  ln ${pkgdir}/usr/lib32/libcharset.so.1.0.0 ${pkgdir}/usr/lib32/libcharset.so.1
  ln ${pkgdir}/usr/lib32/libcharset.so.1.0.0 ${pkgdir}/usr/lib32/libcharset.so
  # mv ${pkgdir}/usr/include/{iconv.h,libiconv.h}
  # mv ${pkgdir}/usr/bin/{iconv,libiconv}
  # mv ${pkgdir}/usr/share/man/man1/{,lib}iconv.1
  # mv ${pkgdir}/usr/share/man/man3/{,libiconv_}iconv.3
  # mv ${pkgdir}/usr/share/man/man3/{,libiconv_}iconvctl.3
  # mv ${pkgdir}/usr/share/man/man3/{,libiconv_}iconv_open.3
  # mv ${pkgdir}/usr/share/man/man3/{,libiconv_}iconv_close.3
  # mv ${pkgdir}/usr/share/man/man3/{,libiconv_}iconv_open_into.3
}
# vim:set ts=2 sw=2 et:
