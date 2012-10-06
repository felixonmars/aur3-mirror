# Maintainer: David McIlwraith <archaios at archaios dot net>
# Contributor: Peter Feigl <peter.feigl at gmail dot com>
pkgname=crossfire-client-svn
pkgver=18461
pkgrel=1
pkgdesc="A free and open source cross platform MMORPG."
url="http://crossfire.real-time.com/"
arch=('i686' 'x86_64')
license=('GPL2')
depends=('gtk2' 'sdl' 'alsa-lib' 'lua' 'libgl' 'libglade' 'curl')
makedepends=('subversion' 'autoconf' 'automake' 'libtool')
conflicts=('crossfire-client')

_svntrunk="https://crossfire.svn.sourceforge.net/svnroot/crossfire/client/trunk"
_svnmod="client"

build() {
  cd "$srcdir"
  msg "Connecting to SVN server..."

  if [[ -d "$_svnmod/.svn" ]]; then
    (cd "$_svnmod" && svn up -r "$pkgver")
  else
    svn co "$_svntrunk" --config-dir ./ -r "$pkgver" "$_svnmod"
  fi

  msg "SVN checkout done or server timeout"
  msg "Starting build..."

  rm -rf "$srcdir/$_svnmod-build"
  cp -r "$srcdir/$_svnmod" "$srcdir/$_svnmod-build"
  cd "$srcdir/$_svnmod-build"

  # Upstream deprecates use of autogen.sh, included aclocal.m4 is
  # out-of-date.
  autoreconf -f -i

  # Build
  ./configure --prefix=/usr --datadir=/usr/share || return 1
  make || return 1
}

package() {
  cd "$srcdir/$_svnmod-build"
  make DESTDIR="$pkgdir/" install
}

# vim:set ts=2 sw=2 et:
