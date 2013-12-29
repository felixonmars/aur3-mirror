# Maintainer: David Roheim <david dot roheim at gmail dot com>
# Contributor: Arthur Darcet <arthur.darcet at m4x.org>
# Contributor: Techlive Zheng <techlivezheng at gmail.com>

pkgname=libiconv
pkgver=1.14
pkgrel=2
pkgdesc='Provides GNU libiconv.so and libcharset.so'
arch=('i686' 'x86_64')
url='http://www.gnu.org/software/libiconv/'
license=('LGPL')
source=("http://ftp.gnu.org/pub/gnu/${pkgname}/${pkgname}-${pkgver}.tar.gz")
sha256sums=('72b24ded17d687193c3366d0ebe7cde1e6b18f0df8c55438ac95be39e8a30613')
options=(!libtool)

build() {
  cd $srcdir/${pkgname}-${pkgver}
  sed '/LD_RUN_PATH/d' -i Makefile.in
  ./configure --prefix=/usr
  cp -f /usr/include/stdio.h srclib/stdio.in.h
  make
}

package() {
  cd ${srcdir}/${pkgname}-${pkgver}
  make DESTDIR=${pkgdir} LIBDIR=/usr/lib install
  mv ${pkgdir}/usr/include/{iconv.h,libiconv.h}
  mv ${pkgdir}/usr/bin/{iconv,libiconv}
  mv ${pkgdir}/usr/share/man/man1/{,lib}iconv.1
  mv ${pkgdir}/usr/share/man/man3/{,libiconv_}iconv.3
  mv ${pkgdir}/usr/share/man/man3/{,libiconv_}iconvctl.3
  mv ${pkgdir}/usr/share/man/man3/{,libiconv_}iconv_open.3
  mv ${pkgdir}/usr/share/man/man3/{,libiconv_}iconv_close.3
  mv ${pkgdir}/usr/share/man/man3/{,libiconv_}iconv_open_into.3
}
# vim:set ts=2 sw=2 et:
