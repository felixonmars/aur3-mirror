# Contributor: Christoph Zeiler <archNOSPAM_at_moonblade.dot.org>

pkgname=strawberry-doom-svn
pkgver=584
pkgrel=1
pkgdesc="A fork of Chocolate Doom extending certain engine limits"
arch=('i686' 'x86_64')
url="http://doom.wikia.com/wiki/Strawberry_Doom"
license=('GPL')
depends=('sdl_mixer' 'sdl_net')
makedepends=('subversion' 'autoconf' 'automake' 'make')
provides=('strawberry-doom')
conflicts=('strawberry-doom')

_svntrunk="http://remood.svn.sourceforge.net/svnroot/remood/branches/strawberry-doom"
_svnmod="strawberry-doom"

build() {
  msg "Connecting to SVN server..."

  [ -d $_svnmod ] && {
	cd $_svnmod
	svn up -r $pkgver
	cd ..

	msg "Local files have been updated."
  } || {
	svn co $_svntrunk $_svnmod -r $pkgver --config-dir ./
  }

  msg "SVN checkout done or server timeout"

  rm -rf $_svnmod-build
  cp -rf $_svnmod/ $_svnmod-build/
  cd $_svnmod-build

  sed 's|/games|/bin|g' -i {src,setup}/Makefile.am
  sed 's|share/games|share|g' -i src/d_iwad.c
  sed	-e '/samplerate/d' \
	-e 's| CFLAGS=|: # CFLAGS=|g' \
	-i configure.in

  ./autogen.sh --prefix=/usr

  msg "Starting make..."

  make || return 1
  make DESTDIR="$pkgdir" install

  # remove default.cfg manpage (conflicting with Chocolate Doom's)
  rm -f "$pkgdir"/usr/share/man/man5/default.cfg.5
}

# vim:set ts=2 sw=2 et:
