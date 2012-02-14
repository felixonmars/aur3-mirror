# Maintainer: Mikael Eriksson <mikael_eriksson@miffe.org>

pkgname=doomseeker-hg
pkgver=770
pkgrel=1
pkgdesc="Doomseeker is a cross-platform server browser for Doom."
arch=('i686' 'x86_64')
url="http://doomseeker.drdteam.org/"
license=('GPL')
depends=('qt')
makedepends=('mercurial' 'cmake')
provides=('doomseeker')
conflicts=('doomseeker')

_hgroot=https://bitbucket.org/Blzut3/doomseeker
_hgrepo=doomseeker

build() {
  cd "$srcdir"
  msg "Connecting to Mercurial server...."

  if [[ -d "$_hgrepo" ]]; then
    cd "$_hgrepo"
    hg pull -u || true
    msg "The local files are updated."
  else
    hg clone "$_hgroot" "$_hgrepo"
  fi

  msg "Mercurial checkout done or server timeout"
  msg "Starting build..."

  rm -rf "$srcdir/build"
  mkdir "$srcdir/build"
  cd "$srcdir/build"

  cmake -DCMAKE_INSTALL_PREFIX=/usr ../$_hgrepo

  make
}

package() {
  cd "$srcdir/build"
  make DESTDIR="$pkgdir/" install
}

# vim:set ts=2 sw=2 et:
