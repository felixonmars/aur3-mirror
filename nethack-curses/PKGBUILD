# Maintainer : Tasos Latsas <tlatsas2000 at gmail dot com>
# Contributor : schuay <jakob.gruber@gmail.com>
# Contributor : kevin <kevin@archlinux.org>
# Contributor : Christian Schmidt <mucknert@gmx.net>
# Contributor : Markus Meissner <markus@meissna.de>

pkgname=nethack-curses
_patch="nh343-curses-beta3"
_nhver=3.4.3
pkgver="${_nhver}beta3"
pkgrel=1
pkgdesc='Nethack with alternate text interface GUI'
arch=('i686' 'x86_64')
url="http://nethack-curses.wikia.com/wiki/NetHack_Curses_Interface_Wiki"
license=('custom')
depends=('ncurses' 'gzip')
conflicts=('nethack')
provides=('nethack')
install="nethack-curses.install"
source=("http://downloads.sourceforge.net/nethack/${_nhver}/nethack-${_nhver//.}-src.tgz"
        "http://nethack.edeca.net/karl/${_patch}.patch.gz"
        "nethackrc.proto")
md5sums=('21479c95990eefe7650df582426457f9'
         '1c75ef45524ebbd490f68a9db1559f2e'
         'f2601261949b5606d5d09a61527a2d49')

build(){
  cd ${srcdir}/nethack-${_nhver}/

  patch -Np1 -i ${srcdir}/${_patch}.patch

  sh sys/unix/setup.sh

  sed -e '/define HACKDIR/ s|/usr/games/lib/nethackdir|/usr/share/nethack/|' \
      -e '/^#define COMPRESS\s/ s|/usr/bin/compress|/bin/gzip|' \
      -e '/^#define COMPRESS_EXTENSION/ s|".Z"|".gz"|' \
      -e 's|^/\* \(#define DLB\) \*/|\1|' -i include/config.h

  sed -e 's|^/\* \(#define LINUX\) \*/|\1|' \
      -e 's|^/\* \(#define TIMED_DELAY\) \*/|\1|' -i include/unixconf.h

  sed -e 's|^# \(WINTTYLIB = -lncurses\)|\1|' \
      -e 's|^WINTTYLIB = -ltermlib|#&|' -i src/Makefile

  # we are setting up for setgid games, so modify all necessary permissions
  # to allow full access for groups

  sed -e '/^GAMEDIR\s*=/ s|/games/.*$|/share/$(GAME)|' \
      -e '/^GAMEUID\s*=/ s|games|root|' \
      -e '/^GAMEGRP\s*=/ s|bin|games|' \
      -e '/^GAMEPERM\s*=/ s|04755|02755|' \
      -e '/^FILEPERM\s*=/ s|0644|0664|' \
      -e '/^DIRPERM\s*=/ s|0755|0775|' \
      -e '/^SHELLDIR\s*=/ s|/games|/bin|' -i Makefile

  sed -e "/^MANDIR\s*=/s|/usr/man/man6|$pkgdir/usr/share/man/man6|" -i doc/Makefile


  make
}
  
package() {
  cd ${srcdir}/nethack-${_nhver}/

  install -dm755 $pkgdir/usr/share/{man/man6,doc/nethack}

  make PREFIX=$pkgdir/usr install manpages

  sed -e "s|HACKDIR=${pkgdir}/usr/|HACKDIR=/usr/|" \
      -e 's|HACK=$HACKDIR|HACK=/usr/lib/nethack|' \
      -i ${pkgdir}/usr/bin/nethack

  install -dm755 ${pkgdir}/usr/lib/nethack
  mv ${pkgdir}/usr/share/nethack/{nethack,recover} ${pkgdir}/usr/lib/nethack/
  install -Dm644 doc/Guidebook.txt ${pkgdir}/usr/share/doc/nethack/Guidebook.txt
  install -Dm644 ${srcdir}/nethackrc.proto ${pkgdir}/usr/share/doc/nethack
  install -Dm644 dat/license ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE
}
