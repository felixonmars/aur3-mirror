# Maintainer: Nikolay Bryskin <devel.niks@gmail.com>
pkgname=python-geoip-hg
pkgver=17
pkgrel=1
pkgdesc="Python3 bindings for the GeoIP IP-to-country resolver library."
arch=(any)
url="http://code.google.com/p/pygeoip"
license=('LGPL')
groups=()
depends=('geoip' 'python' 'python-six')
makedepends=('mercurial' 'patch' 'python' 'python-distribute')
provides=('python-geoip')
conflicts=()
replaces=()
backup=()
options=()
install=
source=()
noextract=()
md5sums=() #generate with 'makepkg -g'

_hgroot="https://code.google.com/p"
_hgrepo="pygeoip"

build() {
  cd "$srcdir"
  msg "Connecting to Mercurial server...."

  if [ -d $_hgrepo ] ; then
    cd $_hgrepo
    hg pull -u
    msg "The local files are updated."
  else
    hg clone $_hgroot $_hgrepo
  fi

  msg "Mercurial checkout done or server timeout"
  msg "Starting make..."

  rm -rf "$srcdir/$_hgrepo-build"
  cp -r "$srcdir/$_hgrepo" "$srcdir/$_hgrepo-build"
  cd "$srcdir/$_hgrepo-build"

  #
  # BUILD HERE
  #

  2to3 setup.py | patch -p0
  python3 setup.py build
}

package() {
  cd "$srcdir/$_hgrepo-build"
  python3 setup.py install --root="$pkgdir/"
} 
