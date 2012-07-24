# Contributor: Lucas Murray <lmurray undefinedfire com>
# Contributor: tobias <tobias@archlinux.org>
# Contributor: dibblethewrecker dibblethewrecker.at.jiwe.dot.org

pkgname=rxvt-unicode-noinc
pkgver=9.15
pkgrel=1
pkgdesc="An unicode enabled rxvt-clone terminal emulator (urxvt) with the window resize increment hint disabled"
arch=(i686 x86_64)
depends=('gcc-libs' 'libxft' 'libxpm')
makedepends=('ncurses' 'perl>=5.10.0' 'pkgconfig')
optdepends=('perl: lots of utilities' 'gtk2-perl: to use the urxvt-tabbed')
provides=('rxvt-unicode')
conflicts=('rxvt-unicode')
url="http://software.schmorp.de/pkg/rxvt-unicode.html"
license=("GPL2")
source=('http://dist.schmorp.de/rxvt-unicode/rxvt-unicode-9.15.tar.bz2'
        'rxvt-unicode.desktop' 'rxvt-unicode.png'
        'popup-menu-hang.diff' 'noinc.diff')
md5sums=('15595aa326167ac5eb68c28d95432faf'
         '5bfefa1b41c2b81ca18f2ef847330543'
         '84328cada91751df07324d95f8be4d1b'
         'aead33ba3b08eeb251fb0c1427a4a024'
         '1c85de8253b3a9002fabaaaccbdb51de')
sha1sums=('e6fdf091860ecb458730dc68b0176f67f207a2f7'
          '79b7cacb7d6ce4a34f8a31a2e33475a8f7bf69cb'
          '9ff58d7b1d60838c51c9045bc0be342fac456790'
          'ec4013f4af3a45da928b75f40fbf6389070e7fdd'
          'e9fbc2c35c4de3f04d9c9843d133f6efbce50565')

build() {
  cd "${srcdir}/rxvt-unicode-${pkgver}"
  patch -p0 < ../popup-menu-hang.diff
  patch -p1 < ../noinc.diff
  ./configure --prefix=/usr \
    --with-terminfo=/usr/share/terminfo \
    --enable-font-styles \
    --enable-xim \
    --enable-keepscrolling \
    --enable-selectionscrolling \
    --enable-smart-resize \
    --enable-transparency \
    --enable-utmp \
    --enable-wtmp \
    --enable-lastlog
  make
  install -d "${pkgdir}/usr/share/terminfo"
  export TERMINFO="${pkgdir}/usr/share/terminfo"
  make DESTDIR="${pkgdir}" install
 # install the tabbing wrapper ( requires gtk2-perl! )
  sed -i 's/\"rxvt\"/"urxvt"/' doc/rxvt-tabbed || return 1
  install -Dm 755 doc/rxvt-tabbed "${pkgdir}/usr/bin/urxvt-tabbed"
 # install freedesktop menu and icon ( icon from cvs checkout )
  install -Dm644 ../rxvt-unicode.desktop \
    "${pkgdir}/usr/share/applications/rxvt-unicode.desktop"
  install -Dm644 ../rxvt-unicode.png \
    "${pkgdir}/usr/share/pixmaps/rxvt-unicode.png"
}
