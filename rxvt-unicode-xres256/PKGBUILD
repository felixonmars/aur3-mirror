# Maintainer: baskerville <baskerville a lavabit o com>

pkgname=rxvt-unicode-xres256
_pkgname=rxvt-unicode
pkgver=9.15
pkgrel=1
pkgdesc="A version of rxvt-unicode with support for extended ANSI colors"
arch=('i686' 'x86_64')
url="http://software.schmorp.de/pkg/rxvt-unicode.html"
license=('GPL')
depends=('gcc-libs' 'libxft' 'gdk-pixbuf2' 'perl')
optdepends=('gtk2-perl: to use the urxvt-tabbed')
provide=('rxvt-unicode')
conflicts=('rxvt-unicode')
changelog=ChangeLog
source=(http://dist.schmorp.de/rxvt-unicode/${_pkgname}-${pkgver}.tar.bz2 \
        ${_pkgname}.desktop ${_pkgname}_xres256.diff)
md5sums=('15595aa326167ac5eb68c28d95432faf'
         '3de6c13126a45bc3bc9f6bba077a1311'
         '1271bec40cdfb91166786c87639eeded')
sha1sums=('e6fdf091860ecb458730dc68b0176f67f207a2f7'
          '962aebc88982dbeb62a7c4a051ff567e015f61a0'
          'd407962493c52569787e5ad3920e006cb88ff137')

build() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  patch -p1 -i ../${_pkgname}_xres256.diff
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
  cd "${srcdir}/${_pkgname}-${pkgver}"
  install -d "${pkgdir}/usr/share/terminfo"
  export TERMINFO="${pkgdir}/usr/share/terminfo"
  make DESTDIR="${pkgdir}" install
 # install the tabbing wrapper ( requires gtk2-perl! )
  sed -i 's/\"rxvt\"/"urxvt"/' doc/rxvt-tabbed
  install -Dm 755 doc/rxvt-tabbed "${pkgdir}/usr/bin/urxvt-tabbed"
 # install freedesktop menu
  install -Dm644 ../${_pkgname}.desktop \
    "${pkgdir}/usr/share/applications/${_pkgname}.desktop"
}
