# Maintainer: SebRmv <sbriais at-symbol free dot fr>
pkgname=virtualjaguar-svn
pkgver=418
pkgrel=1
pkgdesc="A portable Atari Jaguar emulator"
arch=(i686)
url=http://icculus.org/virtualjaguar/
license=('GPL')
depends=('qt' 'gcc' 'gdb' 'sdl' 'zlib' 'libcdio' 'freeglut')
makedepends=('subversion')
source=('mainwin.patch')
sha1sums=('9b1852b531c62e80f514cd1b361a0cb341ddcbdb')

_svntrunk=https://shamusworld.gotdns.org/svn/virtualjaguar/trunk
_svnmod=virtualjaguar

build() {
  cd "$srcdir"
  msg "Connecting to SVN server...."

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
  patch -p0 < "$startdir/mainwin.patch"

  make
}

package() {
  cd "$srcdir/$_svnmod-build"
  mkdir -p $pkgdir/usr/bin/
  cp virtualjaguar $pkgdir/usr/bin/virtualjaguar
}
