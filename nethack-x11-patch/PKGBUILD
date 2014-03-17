# Contributor : skualito <lepascalou AT gmail DoT CoM>
# Contributor : Daenyth <Daenyth+arch _AT_ gmail _DOT_ com>
# Contributor : wizzomafizzo <wizzomafizzo@gmail.com>
# Contributor : kevin <kevin@archlinux.org>
# Contributor : Christian Schmidt <mucknert@gmx.net>
# Contributor : Markus Meissner <markus@meissna.de>

pkgname=nethack-x11-patch
pkgver=3.4.3
pkgrel=3
pkgdesc="A single player dungeon exploration game patched with UI enhancements"
url="http://www.nethack.org/index.html"
license=('custom: nethack')
arch=('any')
depends=('ncurses' 'gzip' 'libx11')
makedepends=(flex bison)
source=(http://downloads.sourceforge.net/sourceforge/nethack/nethack-343-src.tgz
        nh343-menucolor.diff
        hpmon.diff
        nethack-3.4.3-gray-1.diff
        dump-343.diff)

md5sums=('21479c95990eefe7650df582426457f9'
         'ade00f9cb51f1b0140557d329d56844c'
         'a8e5cab6a93100612d428f3973dc418f'
         '4d2576ef824b756b2b28ac333fb77535'
         'a9631ce3da9b4a57b6a2e6011509ca90')

backup=('usr/share/nethack/record'
        'usr/share/nethack/logfile')
conflicts=('nethack')
provides=("nethack=$pkgver")
install=nethack-x11-patch.install

prepare() {

  # Add the patches to the source
  cd "$srcdir/nethack-$pkgver"
  patch -Np1 -i $srcdir/nh343-menucolor.diff
  patch -Np1 -i $srcdir/hpmon.diff
  patch -Np1 -i $srcdir/dump-343.diff
  patch -Np1 -i $srcdir/nethack-3.4.3-gray-1.diff

  # Run the setup script
  cd "$srcdir/nethack-$pkgver/sys/unix"
  sh setup.sh

  # Enable the hpmon and dumplog patches    
  cd "$srcdir/nethack-$pkgver/include"
  sed -e 's/#endif \/\* CONFIG_H \*\///' -i config.h
  echo '#define HPMON' >> config.h
  echo '#define DUMP_FN "/tmp/%n.nh"' >> config.h
  echo '#define AUTOPICKUP_EXCEPTIONS' >> config.h
  echo '#endif /* CONFIG_H */' >> config.h

  # Configure the source for Arch

  sed -e '/define HACKDIR/ s|/usr/games/lib/nethackdir|/usr/share/nethack/|' \
      -e '/^#define COMPRESS\s/ s|/usr/bin/compress|/bin/gzip|' \
      -e '/^#define COMPRESS_EXTENSION/ s|".Z"|".gz"|' \
      -e 's|^/\* \(#define X11_GRAPHICS\) \*/|\1|' \
      -e 's|^/\* \(# define USE_XPM\) \*/|\1|' \
      -e 's|^/\* \(#define SCORE_ON_BOTL\) \*/|\1|' \
      -e 's|^/\* \(#define DLB\) \*/|\1|' -i config.h
  sed -e 's|^/\* \(#define LINUX\) \*/|\1|' \
      -e 's|^/\* \(#define TIMED_DELAY\) \*/|\1|' -i unixconf.h
  cd "$srcdir/nethack-$pkgver/src"
  sed -e 's|^# \(WINTTYLIB = -lncurses\)|\1|' \
      -e 's|^WINTTYLIB = -ltermlib|#&|' \
      -e 's|^WINSRC = $(WINTTYSRC)|& $(WINX11SRC)|' \
      -e 's|^WINOBJ = $(WINTTYOBJ)|& $(WINX11OBJ)|' \
      -e 's|^WINX11LIB = -lXaw -lXmu -lXext -lXt -lX11|#&|' \
      -e 's|^# \(WINX11LIB = -lXaw -lXmu -lXext -lXt -lXpm -lX11 -lm\)|\1|' \
      -e 's|^WINLIB = $(WINTTYLIB)|& $(WINX11LIB)|' -i Makefile

  cd "$srcdir/nethack-$pkgver/win/X11"
  sed -e 's|variable|fixed|' \
      -e 's|nh10|fixed|' \
      -e 's|^!\(NetHack.tile_file: x11tiles\)|\1|' -i NetHack.ad

  cd "$srcdir/nethack-$pkgver"
  sed -e '/^GAMEDIR\s*=/ s|/games/.*$|/share/$(GAME)|' \
      -e '/^GAMEUID\s*=/ s|games|root|' \
      -e '/^GAMEGRP\s*=/ s|bin|root|' \
      -e '/^SHELLDIR\s*=/ s|/games|/bin|' \
      -e 's|^VARDATND = |#&|' \
      -e 's|^# \(VARDATND = x11tiles NetHack.ad pet_mark.xbm rip.xpm\)|\1|' -i Makefile

  # Build and install the package
  make
}

package() {
  cd "$srcdir/nethack-$pkgver"
  make PREFIX="$pkgdir/usr" install

  # Install the license
  install -Dm644 dat/license "$pkgdir/usr/share/licenses/nethack/COPYING"

  # Patch the bin script to work
  sed -e 's|HACKDIR=.*/pkg/usr/|HACKDIR=/usr/|' -i "$pkgdir/usr/bin/nethack"

}

# vim:set ts=2 sw=2 et:
