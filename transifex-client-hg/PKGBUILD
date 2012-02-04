# Maintainer: Patrick McCarty <pnorcks at gmail dot com>

pkgname=transifex-client-hg
pkgver=159
pkgrel=1
pkgdesc="The Transifex command-line tool (Mercurial snapshot)"
arch=(any)
url="http://code.indifex.com/transifex-client/src"
license=('GPL2')
depends=('python2' 'python2-distribute')
makedepends=('mercurial')
provides=('transifex-client')
conflicts=('transifex-client')
source=()
md5sums=()

_hgroot="https://bitbucket.org/indifex"
_hgrepo="transifex-client"

build() {
  cd "$srcdir"
  msg "Connecting to Mercurial server...."

  if [ -d ${_hgrepo} ] ; then
    cd ${_hgrepo}
    hg pull -u
    msg "The local files are updated."
  else
    hg clone ${_hgroot}/${_hgrepo} ${_hgrepo}
  fi

  msg "Mercurial checkout done or server timeout"
  msg "Starting make..."

  rm -rf "$srcdir/${_hgrepo}-build"
  cp -r "$srcdir/${_hgrepo}" "$srcdir/${_hgrepo}-build"
  cd "$srcdir/${_hgrepo}-build"

  python2 setup.py install --root=$pkgdir/ --optimize=1
}
