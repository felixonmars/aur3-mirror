# Contributor: Alex Ferguson <thoughtmonster at gmail>
# Contributor: Anton Bazhenov <anton.bazhenov at gmail>
# Maintainer: Lone_Wolf <lonewolf@xs4all.nl>
# Maintainer: denton <e9203.00 gmail>
pkgname=vulture-nethack
pkgver=2.3.67
pkgrel=0
pkgdesc='An isometric graphical interface for the NetHack game'
arch=('i686' 'x86_64')
url=http://clivecrous.github.com/vulture
license=(custom:NetHack General Public Licence)
depends=('hicolor-icon-theme' 'libpng' 'sdl_mixer' 'sdl_ttf')
makedepends=('bison' 'flex' 'p7zip')
install=$pkgname.install
source=(http://www.darkarts.co.za/vulture/download/vulture-$pkgver.7z
	vulture-nethack.png)
md5sums=('be1d0f07095d3385728821e8269a5723'
         '214218b48019b81d59120e4e84ce10ab')

build() {
  7z x -y vulture-$pkgver.7z

  cd vulture-$pkgver/nethack
  sed -e 's|^/\* \(#define LINUX\) \*/|\1|' \
      -e 's|^/\* \(#define TIMED_DELAY\) \*/|\1|' \
      -e 's|^/\* \(#define VAR_PLAYGROUND.*\) \*/|\1|' \
      -e "/^#define VAR_PLAYGROUND/ s|/var/lib/games/nethack|/var/games/$pkgname|" -i include/unixconf.h

  sed -e '/^GAMEDIR/     s|$(PREFIX)/games/lib/$(GAME)dir|$(PREFIX)/share/$(GAME)|' \
      -e '/^VARDIR/      s|$(GAMEDIR)|$(PREFIX)/../var/games/$(GAME)|' \
      -e '/^SHELLDIR/    s|$(PREFIX)/games|$(PREFIX)/bin|' \
      -e '/^GAMEUID/     s|games|root|' \
      -e '/^GAMEGRP/     s|bin|root|' \
      -e '/^GAMEPERM/    s|04755|0755|' -i sys/unix/Makefile.top

  sed -e "/^#  define HACKDIR/          s|/usr/games/lib/nethackdir|/usr/share/$pkgname|" \
      -e '/^#define COMPRESS/           s|/usr/bin/compress|/bin/gzip|' \
      -e '/^#define COMPRESS_EXTENSION/ s|.Z|.gz|' -i include/config.h

  sed -e "/^HACK/    s|\$HACKDIR/nethack|/usr/bin/$pkgname|" \
      -e "/^HACKDIR/ s|/usr/games/lib/nethackdir|/usr/share/$pkgname|" -i sys/unix/nethack.sh
  
  sh sys/unix/setup.sh
  make || return 1
  make PREFIX=$pkgdir/usr install
  
  chgrp -R	games $pkgdir/var/games
  chmod -R	775   $pkgdir/var/games
  chmod		664   $pkgdir/var/games/$pkgname/{logfile,perm,record}

  cd $pkgdir/usr
  mv bin/$pkgname{,-start}
  mv share/$pkgname/$pkgname bin/$pkgname
  mv share/$pkgname/recover bin/$pkgname-recover

  install -Dm644 share/$pkgname/license share/licenses/$pkgname/LICENSE
  install -Dm644 ../../$pkgname.png share/icons/hicolor/48x48/apps/$pkgname.png
  install -Dm644 $srcdir/vulture-$pkgver/dist/linux/$pkgname.desktop share/applications/$pkgname.desktop

  rm -f share/$pkgname/{*.{ico,png,nh},license}
}
