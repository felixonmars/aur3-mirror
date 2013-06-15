# Maintainer: Jaroslav Lichtblau <dragonlord@aur.archlinux.org>
# Contributor: wizzomafizzo <wizzomafizzo@gmail.com>
# Contributor: Richard Hoffman <coverslide@gmail.com>

pkgname=slashem-curses
pkgver=0.0.7E7F3
pkgrel=1
pkgdesc='Nethack variant Super Lotsa Added Stuff Hack - Extended Magic'
arch=('i686' 'x86_64')
url="http://www.slashem.org/"
license=('custom')
depends=('ncurses' 'gzip')
options=('!makeflags')
conflicts=('slashem')
source=('http://downloads.sourceforge.net/sourceforge/slashem/se007e7f3.tar.gz'
        'http://nethack.edeca.net/karl/se007E7F3-curses-a4.patch.gz')

md5sums=('54b4534fe85f08722e8b6b38d52c2e9a'
         'c85bfb77e3a23e550a8ec8d312894cb5')

build(){
  cd ${srcdir}/slashem-$pkgver

  patch -Np1 -i ${srcdir}/se007E7F3-curses-a4.patch

  sh sys/unix/setup.sh

  cd ${srcdir}/slashem-$pkgver/include
  sed -e '/define COMPRESS/ s|/usr/bin/compress|/bin/gzip|' \
      -e '/define COMPRESS_EXTENSION/ s|".Z"|".gz"|' \
      -e 's|^/\* \(#define DLB\) \*/|\1|' -i config.h
  sed -e 's|^/\* \(#define LINUX\) \*/|\1|' \
      -e 's|^/\* \(#define TIMED_DELAY\) \*/|\1|' -i unixconf.h
  cd ${srcdir}/slashem-$pkgver/src
  sed -e 's|^# \(WINTTYLIB = -lncurses\)|\1|' \
      -e 's|^WINTTYLIB = -ltermlib|#&|' -i Makefile
  cd ..
  sed -e '/^GAMEUID\s*=/ s|games|root|' \
      -e '/^GAMEGRP\s*=/ s|bin|root|' \
      -e '/^SHELLDIR\s*=/ s|/games|/bin|' \
      -e '/GAMEDIR/ s|/local/slashemdir|/share/slashem|' \
      -e '/SHELLDIR/ s|/local/bin|/bin|' -i Makefile

  make || return 1
  make PREFIX=${pkgdir}/usr install
  sed -e "s|HACKDIR=.*/pkg/$pkgname/usr/|HACKDIR=/usr/|" \
      -i ${pkgdir}/usr/bin/slashem
  install -Dm644 dat/license ${pkgdir}/usr/share/licenses/$pkgname/license
}

#TODO: add package()
