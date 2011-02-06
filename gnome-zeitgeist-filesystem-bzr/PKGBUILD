_bzrdir=zgfs
_bzrname=zeitgeist-filesystem
_realname=gnome-$_bzrname
pkgname=$_realname-bzr
pkgdesc="FUSE filesystem to show zeitgeist events structured by day"
pkgver=73
pkgrel=1
arch=('any')
url="https://launchpad.net/$_bzrname"
license=('GPL v3')
depends=('python' 'gnome-zeitgeist')
makedepends=('bzr' 'setuptools')
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