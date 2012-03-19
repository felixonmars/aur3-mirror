# Contributor: Connor Behan <connor.behan@gmail.com>
# Contributor: Daniel Isenmann <daniel [at] archlinux.org>
# Contributor: dorphell <dorphell@gmx.net>

pkgname=gc-dev
pkgver=7.2alpha6
pkgrel=1
pkgdesc="Development version of the Boehm garbage collector"
arch=('i686' 'x86_64')
url="http://www.hpl.hp.com/personal/Hans_Boehm/gc/"
license=('GPL')
source=("http://www.hpl.hp.com/personal/Hans_Boehm/gc/gc_source/gc-${pkgver}.tar.gz")
depends=('gcc-libs')
conflicts=('gc')
replaces=('gc')
provides=('gc')
options=('!libtool')

build() {
  cd "${srcdir}/gc-${pkgver}"
  sed -i -e 's/pkginclude_HEADERS +=.*//' Makefile.am

  autoreconf -vfi
  ./configure --prefix=/usr --enable-cplusplus
  make
}

package() {
  cd "${srcdir}/gc-${pkgver}"
  make DESTDIR="${pkgdir}" install

  rm -rf "${pkgdir}/usr/share/gc"
  install -m755 -d "${pkgdir}/usr/share/doc/gc"
  install -m644 doc/README{,.{changes,contributors,environment,linux}} \
    "${pkgdir}/usr/share/doc/gc/"

  sed -i -e 's/GC_MALLOC 1L/gc 3/' doc/gc.man
  install -m755 -d "${pkgdir}/usr/share/man/man3"
  install -m644 doc/gc.man "${pkgdir}/usr/share/man/man3/gc.3"
}

md5sums=('319d0b18cc4eb735c8038ece9df055e4')
