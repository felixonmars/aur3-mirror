# Contributor: AJ Ashton <aj.ashton@gmail.com>
pkgname=tilelite-hg
pkgver=80
pkgrel=1
pkgdesc="Lightweight Python tile-server using Mapnik rendering and designed to serve tiles in the OSM (OpenStreetMap) scheme."
arch=('any')
url="http://bitbucket.org/springmeyer/tilelite"
license=('BSD')
depends=('mapnik' 'python2')
makedepends=('mercurial')
source=()
md5sums=()

_hgroot="http://bitbucket.org/springmeyer"
_hgrepo="tilelite"

build() {
  cd "$srcdir"
  msg "Connecting to Mercurial server..."

  if [ -d $_hgrepo ] ; then
    cd $_hgrepo
    hg pull -u || return 1
    msg "The local files are updated."
  else
    hg clone $_hgroot $_hgrepo || return 1
  fi

  msg "Mercurial checkout done or server timeout"
  msg "Starting make..."

  rm -rf "$srcdir/$_hgrepo-build"
  cp -r "$srcdir/$_hgrepo" "$srcdir/$_hgrepo-build"
  cd "$srcdir/$_hgrepo-build"

  # BUILD

  python2 setup.py install --root=$pkgdir || return 1
}
