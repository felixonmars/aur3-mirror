# Contributor: Christoph Zeiler <archNOSPAM_at_moonblade.dot.org>

pkgname=chocolate-doom-raven-svn
pkgver=1528
pkgrel=1
pkgdesc="A Doom port compatible with the DOS version (Heretic/Hexen support)"
arch=('i686' 'x86_64')
url="http://www.chocolate-doom.org/"
license=('GPL')
depends=('sdl_mixer' 'sdl_net')
optdepends=('freedoom' 'doom1-wad')
makedepends=('subversion' 'autoconf' 'automake')
install=chocolate-doom.install
provides=('chocolate-doom')
conflicts=('chocolate-doom')

_svntrunk=http://chocolate-doom.svn.sourceforge.net/svnroot/chocolate-doom/branches/raven-branch
_svnmod=chocolate-doom-raven

build() {
  [ -d $_svnmod/.svn ] && {
	cd $_svnmod
	svn up -r $pkgver
	cd ..
  } || {
	svn co $_svntrunk --config-dir ./ -r $pkgver $_svnmod
  }

  msg "SVN checkout done or server timeout"

  rm -rf $_svnmod-build
  cp -rf $_svnmod/ $_svnmod-build/
  cd $_svnmod-build

  sed 's|/games|/bin|g' -i src/{,setup/}Makefile.am
  sed 's|share/games|share|g' -i src/d_iwad.c
  sed	-e '/samplerate/d' \
	-e 's| CFLAGS=|: # CFLAGS=|g' \
	-i configure.in

  ./autogen.sh --prefix=/usr

  msg "Starting make..."

  make || return 1
  make DESTDIR="$pkgdir" install
}
