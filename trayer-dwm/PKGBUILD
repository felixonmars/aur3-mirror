# Maintainer: JokerBoy <jokerboy at punctweb dot ro>

pkgname=trayer-dwm
_pkgname=trayer
pkgver=1.1.4
pkgrel=1
pkgdesc="A lightweight GTK2-based systray with multi monitor support, for DWM"
arch=('i686' 'x86_64')
url="https://github.com/sargon/trayer-srg/"
license=('GPL' 'MIT')
makedepends=('libxmu')
depends=('gtk2')
provides=('trayer')
conflicts=('trayer')
source=("${_pkgname}-${pkgver}.tar.gz::https://github.com/sargon/trayer-srg/tarball/master"
        'manpage.diff' 'dwm.diff')
md5sums=('d2d3f0f5306c06b961652ef992e9c7aa'
         '3f1c92bbe275f186b613c04a47e8e977'
         '04fc0ef6f51fd4a01d2adde3f234781a')

build() {
  cd "${srcdir}" && cd "`find . -type d -name sargon-trayer-srg-\*`"
  patch -p1 -i "$srcdir/manpage.diff"
  patch -p1 -i "$srcdir/dwm.diff"
  sed -i 's/$(LIBS) $(OBJ) $(SYSTRAYOBJ)/$(OBJ) $(SYSTRAYOBJ) $(LIBS)/' Makefile
  make CFLAGS="${CFLAGS}" LDFLAGS="${LDFLAGS}"
}

package() {
  cd "${srcdir}" && cd "`find . -type d -name sargon-trayer-srg-\*`"
  make PREFIX="${pkgdir}/usr" install
  install -D -m644 trayer.1 "${pkgdir}/usr/share/man/man1/trayer.1"
  install -D -m644 COPYING "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
