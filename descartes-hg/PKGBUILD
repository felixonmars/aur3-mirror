# Maintainer: Panos Mavrogiorgos <pmav99@gmail.com>

pkgname=descartes-hg
pkgver=12
pkgrel=2
arch=('i686' 'x86_64')
pkgdesc="Use Shapely_ or GeoJSON-like geometric objects as matplotlib paths and patches."
url="http://bitbucket.org/sgillies/descartes"
license=('Unknown')
depends=('python2' 'python2-numpy' 'python2-matplotlib')
optdepends=('shapely')
makedepends=('python2' 'mercurial')
install=
source=()
md5sums=()

_hgroot="http://bitbucket.org/sgillies"
_hgrepo="descartes"

build() {
  cd "$srcdir"
  msg "Connecting to Mercurial server...."

  if [ -d $_hgrepo ] ; then
    cd $_hgrepo
    hg pull -u || return 1
    msg "The local files are updated."
  else
    hg clone $_hgroot $_hgrepo || return 1
  fi

  msg "Mercurial checkout done or server timeout"
  msg "Starting make..."

  rm -rf "$srcdir/$_hgrepo-$pkgver"
  cp -r "$srcdir/$_hgrepo" "$srcdir/$_hgrepo-$pkgver"
}

package() {
  cd "$srcdir/$_hgrepo-$pkgver"
  python2 setup.py install --root="$pkgdir/" --optimize=1
} 

# vim:set ts=2 sw=2 et:
