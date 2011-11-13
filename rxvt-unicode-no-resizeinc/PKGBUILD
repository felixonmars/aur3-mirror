pkgname=rxvt-unicode-no-resizeinc
pkgver=9.12
pkgrel=1
pkgdesc="rxvt-unicode without increment resize"
arch=('i686' 'x86_64')
url="http://software.schmorp.de/pkg/rxvt-unicode.html"
license=('GPL')
depends=('gcc-libs' 'libxft' 'gdk-pixbuf2')
optdepends=('perl: lots of utilities' 'gtk2-perl: to use the urxvt-tabbed')
provides=('rxvt-unicode')
conflicts=('rxvt-unicode')
source=(http://dist.schmorp.de/rxvt-unicode/rxvt-unicode-${pkgver}.tar.bz2 \
        rxvt-unicode.desktop \
	no-resizeinc.diff)
md5sums=('945af37d661c8c45a7cac292160e7c70'
         '3de6c13126a45bc3bc9f6bba077a1311'
	 'f7624c1f7219dbf97004c76c03f752db')
sha1sums=('4cbf0516b8304dfb041b9f3e5aaba662fee4b979'
          '962aebc88982dbeb62a7c4a051ff567e015f61a0'
	  '761fb5d20a3051307806b7749937fffd6275986c')

build() {
  cd "${srcdir}/rxvt-unicode-${pkgver}"
  patch -p0 < ../../no-resizeinc.diff || return 1
  ./configure --prefix=/usr \
    --with-terminfo=/usr/share/terminfo \
    --enable-256-color \
    --enable-font-styles \
    --enable-xim \
    --enable-keepscrolling \
    --enable-selectionscrolling \
    --enable-smart-resize \
    --enable-pixbuf \
    --enable-transparency \
    --enable-utmp \
    --enable-wtmp \
    --enable-lastlog \
    --disable-frills
  make
}

package() {
  cd "${srcdir}/rxvt-unicode-${pkgver}"
  install -d "${pkgdir}/usr/share/terminfo"
  export TERMINFO="${pkgdir}/usr/share/terminfo"
  make DESTDIR="${pkgdir}" install
 # install the tabbing wrapper ( requires gtk2-perl! )
  sed -i 's/\"rxvt\"/"urxvt"/' doc/rxvt-tabbed
  install -Dm 755 doc/rxvt-tabbed "${pkgdir}/usr/bin/urxvt-tabbed"
 # install freedesktop menu
  install -Dm644 ../rxvt-unicode.desktop \
    "${pkgdir}/usr/share/applications/rxvt-unicode.desktop"
}
