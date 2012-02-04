# Contributor: Stefan Clarke <fm0nk3y@yahoo.co.uk>
# Maintainer: Anton Bazhenov <anton.bazhenov at gmail>
# Maintainer: denton <e9203.00 gmail>
pkgname=vulturesclaw
pkgver=2.2.100
pkgrel=1
pkgdesc="An isometric graphical interface for the Slash'EM game"
arch=(any)
url=http://clivecrous.github.com/vultures
license=(custom:NetHack General Public Licence)
depends=(hicolor-icon-theme libpng sdl_mixer sdl_ttf)
makedepends=(bison flex p7zip)
options=(!makeflags)
install=$pkgname.install
source=(http://cloud.github.com/downloads/clivecrous/vultures/vultures-$pkgver-full.7z)
md5sums=(6180d77089c273b026eb1e0ce356ef38)

build() {
  # Extract
  7z x -y vultures-$pkgver-full.7z

  cd vultures-$pkgver/slashem
  # Configure
  sed -e 's|^/\* \(#define LINUX\) \*/|\1|' \
      -e 's|^/\* \(#define TIMED_DELAY\) \*/|\1|' \
      -e 's|^/\* \(#define VAR_PLAYGROUND.*\) \*/|\1|' \
      -e "/^#define VAR_PLAYGROUND/ s|/var/lib/games/nethack|/var/games/$pkgname|" -i include/unixconf.h

  sed -e '/^GAMEDIR/     s|$(PREFIX)/local/slashemdir|$(PREFIX)/share/$(GAME)|' \
      -e '/^VARDIR/      s|$(GAMEDIR)|$(PREFIX)/../var/games/$(GAME)|' \
      -e '/^SHELLDIR/    s|$(PREFIX)/local/bin|$(PREFIX)/bin|' \
      -e '/^GAMEUID/     s|games|root|' \
      -e '/^GAMEGRP/     s|bin|root|' \
      -e '/^GAMEPERM/    s|04755|0755|' \
      -e '/^VARDIRPERM/  s|0755|0775|' \
      -e '/^VARFILEPERM/ s|0644|0664|' -i sys/unix/Makefile.top

  sed -e "/^#    define HACKDIR/         s|\.|/usr/share/$pkgname|" \
      -e '/^# define COMPRESS/           s|/usr/bin/compress|/bin/gzip|' \
      -e '/^# define COMPRESS_EXTENSION/ s|.Z|.gz|' -i include/config.h

  sed -e "/^HACK/    s|\$HACKDIR/nethack|/usr/bin/$pkgname|" \
      -e "/^HACKDIR/ s|/usr/games/lib/nethackdir|/usr/share/$pkgname|" -i sys/unix/nethack.sh
  
  sh sys/unix/setup.sh
  make || return 1
  make PREFIX=$pkgdir/usr install
  
  chgrp -R games $pkgdir/var/games
  chmod    775   $pkgdir/var/games

  cd $pkgdir/usr
  mv bin/$pkgname{,-start}
  mv share/$pkgname/$pkgname bin/$pkgname
  mv share/$pkgname/recover bin/$pkgname-recover

  install -Dm644 share/$pkgname/license share/licenses/$pkgname/LICENSE
  install -Dm644 $srcdir/vultures-$pkgver/vultures/gamedata/se_icon.png share/icons/hicolor/48x48/apps/$pkgname.png
  install -Dm644 $srcdir/vultures-$pkgver/dist/linux/$pkgname.desktop share/applications/$pkgname.desktop

  rm share/$pkgname/{*.{ico,png,nh},license}
}
