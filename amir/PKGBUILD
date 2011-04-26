# Maintainer: Bersam <Bersam [dot] k [at] gmail>

pkgname=amir
pkgver=84
pkgrel=1
pkgdesc="Just another accounting software designed mainly for persian users"
arch=('any')
url="https://launchpad.net/amir"
license=('GPL')
depends=('python2' 'pygobject' 'pygtk' 'python2-cairo' 'python2-sqlalchemy' 'python2-tempita' 'python2-migrate')
makedepends=('bzr')
#options=(!strip)
source=()
md5sums=()
_bzrtrunk="lp:amir/0.1"
_bzrmod="amir"

build() {
  cd "${srcdir}"

  msg "Connecting to the server...."

  if [ -d ${_bzrmod} ]; then
    bzr up ${_bzrmod}
    msg "The local files are updated."
  else
    bzr co ${_bzrtrunk} ${_bzrmod}
  fi

  msg "BZR checkout done or server timeout"
  msg "Starting make..."
  
  rm -rf "${_bzrmod}-build"
  cp -r "${_bzrmod}" "${_bzrmod}-build"
  cd "${_bzrmod}-build"

  export PYTHON="/usr/bin/python2"

  python2 setup.py install --root=$pkgdir
}
