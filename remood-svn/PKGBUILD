# Contributor: Christoph Zeiler <archNOSPAM_at_moonblade.dot.org>

pkgname=remood-svn
pkgver=679
pkgrel=1
pkgdesc="An advanced Doom game engine based on Doom Legacy"
arch=('i686' 'x86_64')
url="http://remood.sourceforge.net/"
license=('GPL')
depends=('bash' 'sdl')
makedepends=('subversion' 'make')
provides=('remood')
conflicts=('remood')
source=(remood.sh)
md5sums=('693443213b20e33773513d7d41e4c147')

_svntrunk="http://remood.svn.sourceforge.net/svnroot/remood/trunk"
_svnmod="remood"

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

  msg "Starting make..."

  make CC_MODECFLAGS="${CFLAGS} -DNDEBUG" || return 1

  install -Dm755 bin/remood "$pkgdir"/usr/bin/remood.bin
  mkdir -p "$pkgdir"/usr/share/{applications,pixmaps,remood}
  install -m644 bin/remood.wad "$pkgdir"/usr/share/remood/
  install -m644 remood.xpm "$pkgdir"/usr/share/pixmaps/
  install -m644 remood.desktop "$pkgdir"/usr/share/applications/

  install -m755 ../remood.sh "$pkgdir"/usr/bin/remood
}

# vim:set ts=2 sw=2 et:
