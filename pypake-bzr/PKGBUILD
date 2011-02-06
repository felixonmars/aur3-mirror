_bzrdir=pake
_bzrname=$_bzrdir
_realname=pypake
pkgname=$_realname-bzr
pkgdesc="The simple utility for automating tasks like building apps and different bundles, removing temporary files, migrating databases and other stuff."
pkgver=25
pkgrel=1
arch=('any')
url="https://launchpad.net/$_bzrname"
license=('Apache License 2.0')
depends=('python' 'python-yaml')
makedepends=('bzr')
provides=($_realname $_bzrname)

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