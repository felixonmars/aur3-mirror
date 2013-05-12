# Maintainer: Jonathan Liu <net147@gmail.com>
pkgname=mingw32-lbreakout2
_realpkgname=lbreakout2
pkgver=2.6.4
pkgrel=1
pkgdesc="A breakout game with nice effects, graphics, and sounds"
arch=('any')
url="http://lgames.sourceforge.net/index.php?project=LBreakout2"
license=('GPL')
depends=('mingw32-gettext' 'mingw32-libpng' 'mingw32-sdl_mixer' 'mingw32-sdl_net')
options=('!buildflags')
source=("http://downloads.sourceforge.net/lgames/${_realpkgname}-${pkgver/_/-}.tar.gz")
md5sums=('4849af72225a304267eb71a9c100cd48')

build() {
  cd "${srcdir}/${_realpkgname}-${pkgver/_/-}"
  sed -i -e 's#AM_CONFIG_HEADER#AC_CONFIG_HEADERS#' configure.in
  sed -i -e 's#@windres#@i486-mingw32-windres#' client/Makefile.am
  autoreconf
  unset LDFLAGS
  LIBS='-lintl' ./configure --host=i486-mingw32 --prefix=/usr/i486-mingw32 --enable-sdl-net --disable-install
  make
}

package() {
  cd "${srcdir}/${_realpkgname}-${pkgver/_/-}"
  install -D -m644 client/lbreakout2.exe "${pkgdir}/usr/lib/i486-mingw32/opt/${_realpkgname}/lbreakout2.exe"
  install -D -m644 server/lbreakout2server.exe "${pkgdir}/usr/lib/i486-mingw32/opt/${_realpkgname}/lbreakout2server.exe"
  install -d -m755 "${pkgdir}/usr/lib/i486-mingw32/opt/${_realpkgname}"/{gfx,sounds}
  cp -r client/{gfx,gui_theme,levels,sounds} "${pkgdir}/usr/lib/i486-mingw32/opt/${_realpkgname}/"
  find "${pkgdir}" -type f -name 'Makefile*' -delete
}

# vim:set ts=2 sw=2 et:
