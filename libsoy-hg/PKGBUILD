pkgname=libsoy-hg
pkgver=1616
pkgrel=1
pkgdesc='Lib for the 3d cloud game engine PySoy'
arch=('i686' 'x86_64')
url='http://www.pysoy.org/'
license=('GPL')
depends=('python3' 'libdrm' 'mesa' 'libgee' 'gtk2' 'gtkglext' 'ode-compat' 'loudmouth' 'libnice')
makedepends=('mercurial' 'gcc' 'vala' 'orc' 'pkg-config')

_hgroot='http://hg.pysoy.org/'
_hgrepo='libsoy'

build() {
  cd $srcdir

  # Update the repo, else clone a new one
  if [ -d $_hgrepo ]; then
    cd $_hgrepo
    ./waf clean
    hg pull -u
  else
    hg clone ${_hgroot}/${_hgrepo}
    cd $_hgrepo
  fi

  ./waf configure --prefix="/usr/" || return 1
  ./waf build || return 1
}

package() {
  cd $srcdir/"$_hgrepo"
  ./waf install --destdir=$pkgdir || return 1
}
