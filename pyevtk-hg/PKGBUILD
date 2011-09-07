# Contributor: Panos Mavrogiorgos <pmav99@gmail.com>

pkgname=pyevtk-hg
pkgver=22
pkgrel=1
arch=('i686' 'x86_64')
pkgdesc="EVTK (Export VTK) allows exporting data to binary VTK files for visualization and data analysis."
url="http://bitbucket.org/pauloh/pyevtk"
license=('FreeBSD')
depends=('python2' 'mercurial' 'python2-numpy')
optdepends=('cython: for dev only')
makedepends=('python2' 'mercurial')
install=
source=()
md5sums=()

_hgroot="http://bitbucket.org/pauloh"
_hgrepo="pyevtk"

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

  rm -rf "$srcdir/$_hgrepo-build"
  cp -r "$srcdir/$_hgrepo" "$srcdir/$_hgrepo-build"
  cd "$srcdir/$_hgrepo-build"

  #
  # BUILD HERE
  #
  python2 setup.py install --root="$pkgdir" --optimize=1 || return 1
} 


