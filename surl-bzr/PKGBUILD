_bzrdir=surl
_bzrname=$_bzrdir
pkgname=$_bzrname-bzr
pkgdesc="URL shortening command line application that supports various sites."
pkgver=98
pkgrel=1
arch=('any')
url="https://launchpad.net/$_bzrname"
license=('GPL v3')
depends=('python')
makedepends=('bzr')
provides=($_bzrname)

build() {
  cd "$srcdir"
  msg "Connecting to Launchpad BZR server...."

  if [ ! -d ./${_bzrdir} ]; then
    bzr co lp:${_bzrname} ${_bzrdir} -r ${pkgver}
  else
    bzr up ${_bzrdir}
  fi
 
  msg "BZR checkout done or server timeout"
  msg "Starting make..."
  cd $_bzrdir
  python setup.py install --root=$pkgdir || return 1
}