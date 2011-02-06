# Maintainer: Jan "heftig" Steffens <jan.steffens@gmail.com>
# Contributor: Moritz Wilhelmy <echo dGhlLnd1bGYuZ2FuZ0Bnb29nbGVtYWlsLmNvbQ== | base64 -d>
# Contributor: kevin <kevin@archlinux.org>
# Contributor: Christian Schmidt <mucknert@gmx.net>
# Contributor: Markus Meissner <markus@meissna.de>

pkgname=sporkhack-svn
pkgver=817
pkgrel=1
pkgdesc='A single player dungeon exploration game, variant'
arch=(i686 x86_64)
url="http://sporkhack.com/"
license=(custom)
depends=(ncurses gzip)
makedepends=(subversion)
#options=(!strip)

_svntrunk='svn://sporkhack.com/nh'
_svnmod='nh'

build(){
  cd "$srcdir"

  if [ -d $_svnmod/.svn ]; then
    (cd $_svnmod && svn up -r $pkgver) || warning "SVN update failed!"
  else
    svn co $_svntrunk --config-dir ./ -r $pkgver $_svnmod
  fi

  msg2 "SVN checkout done or server timeout"

  rm -rf $_svnmod-build
  svn export $_svnmod $_svnmod-build
  cd $_svnmod-build

  msg2 "Building..."

  # Configure
  sed -e '/define HACKDIR/ s|/usr/games/lib/nethackdir|/usr/share/sporkhack/|' \
      -e '/define COMPRESS/ s|/usr/bin/gzip|/bin/gzip|' \
      -e 's|#define SECURE|/* & */|' \
      -e 's|#define DUMP_LOG|/* & */|' \
      -i include/config.h

  # Fix dirs and perms
  sed -e '/^GAMEDIR\s*=/ s|/games/.*$|/share/sporkhack|' \
      -e '/^GAMEUID\s*=/ s|games|root|' \
      -e '/^GAMEGRP\s*=/ s|bin|root|' \
      -e '/^SHELLDIR\s*=/ s|/games|/bin|' \
      -i Makefile

  # Horribly mutilate manpage
  sed -e '1s/NETHACK/SPORKHACK/' \
      -e '4s/nethack/sporkhack/' \
      -e '62,113s/NetHack/SporkHack/' \
      -e 's/\.B nethack/.B sporkhack/' \
      -e '111s/nethackrc/sporkrc/' \
      -e '232s/nethack/sporkhack/' \
      -e '234s/nethack/sporkhack/' \
      -e '290s/NetHack/SporkHack/' \
      -i doc/nethack.6

  # Debug
  [[ $(check_option strip) == n ]] &&  CFLAGS="-O0 -g3"

  # Allow optimization
  CFLAGS+=" -I../include"
  make CFLAGS="$CFLAGS"
}

package() {
  cd "$srcdir/$_svnmod-build"

  make PREFIX="$pkgdir/usr" install

  # Move binaries to lib
  install -d "$pkgdir/usr/lib/sporkhack"
  mv "$pkgdir"/usr/share/sporkhack/{nethack,recover} "$pkgdir/usr/lib/sporkhack/"

  # Rename launcher so sporkhack doesn't conflict with nethack
  mv "$pkgdir/usr/bin/nethack" "$pkgdir/usr/bin/sporkhack"

  sed -e "s|HACKDIR=$pkgdir/usr/|HACKDIR=/usr/|" \
      -e 's|HACK=$HACKDIR|HACK=/usr/lib/sporkhack|' \
      -i "$pkgdir/usr/bin/sporkhack"

  # Documentation
  install -Dm644 doc/nethack.6 "$pkgdir/usr/share/man/man6/sporkhack.6"
  install -Dm644 doc/Guidebook.txt "$pkgdir/usr/share/doc/sporkhack/Guidebook.txt"

  # License
  install -Dm644 dat/license "$pkgdir/usr/share/licenses/$pkgname/license"
}
