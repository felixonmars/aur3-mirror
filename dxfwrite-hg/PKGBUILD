# Maintainer: Panos Mavrogiorgos <pmav99@gmail.com>

pkgname=dxfwrite-hg
pkgver=162
pkgrel=1
arch=('i686' 'x86_64')
pkgdesc="A Python library to create DXF R12 drawings."
url="https://bitbucket.org/mozman/dxfwrite/overview"
license=('GPL3')
depends=('python2')
optdepends=()
makedepends=('python2' 'mercurial')
install=
source=()
md5sums=()

_hgroot="http://bitbucket.org/mozman"
_hgrepo="dxfwrite"

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
