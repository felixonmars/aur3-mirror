# Maintainer: Jaroslav Lichtblau <dragonlord@aur.archlinux.org>

pkgname=wesnoth-svn
pkgver=40587
pkgrel=1
pkgdesc="The latest version of a turn-based strategy game on a fantasy world."
arch=('i686')
url="http://www.wesnoth.org/"
license=('GPL')
depends=('boost' 'fribidi' 'lua' 'sdl' 'sdl_ttf' 'sdl_net' 'sdl_mixer' 'sdl_image')
makedepends=('openssh' 'python' 'scons' 'subversion')
conflicts=('wesnoth' 'wesnoth-devel')
provides=('wesnoth')
replaces=('wesnoth-cvs')

source=()
md5sums=()

_svntrunk=svn://svn.gna.org/svn/wesnoth/trunk
_svnmod=wesnoth

build() {
  cd "${srcdir}"
  msg "Connecting to gna SVN server..."
  msg "Checking out $_svnmod"

  if [ -d $_svnmod/.svn ]; then
    (cd $_svnmod && svn up -r $pkgver)
  else
    svn co $_svntrunk --config-dir ./ -r $pkgver $_svnmod
  fi

  msg "SVN checkout done or server timeout"
  msg "Setting up build environment..."

  rm -rf ${srcdir}/$_svnmod-build
  cp -r ${_svnmod} ${_svnmod}-build || return 1
  cd ${_svnmod}-build

  msg "Starting build"
  scons prefsdir=.wesnoth-svn prefix=/usr debug=yes || return 1
  scons destdir=${pkgdir} install || return 1
}
