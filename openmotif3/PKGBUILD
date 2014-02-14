# $Id$
# Maintainer: Mathieu Giorgino <clej37@gmail.com>
# Contributor: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Contributor: Enrico Morelli <morelli@cerm.unifi.it>

pkgname=openmotif3
pkgver=2.2.3
pkgrel=1
pkgdesc="Open Motif (the version 2.2.3, giving /usr/lib/libXm.so.3)"
arch=('i686' 'x86_64')
url="http://motif.ics.com"
license=('LGPL')
depends=(libxp libxmu)
makedepends=(libxaw xbitmaps xproto printproto xextproto automake)
conflicts=(lesstif)
options=('!libtool')
source=(http://motif.ics.com/sites/default/files/openmotif-${pkgver}.tar.gz)
md5sums=('94c96a0f94ee0d5e41d3dba2188b263d')

build() {
  cd $srcdir/openMotif-$pkgver

  sed -i 's|^\s*demos\s*$||g' Makefile.am
  sed -i 's|\s*demos\s*||g' Makefile.in
  sed -i 's|doc \\|doc|g' Makefile.am
  (
    # subshell for all steps which fail with _FORTIFY_SOURCE in CPPFLAGS
    export CPPFLAGS="${CPPFLAGS} -O2"
    ./configure --prefix=/usr --mandir=/usr/share/man
  )
  make -j1
}

package () {
  cd $srcdir/openMotif-$pkgver
  make DESTDIR=$pkgdir install
}
