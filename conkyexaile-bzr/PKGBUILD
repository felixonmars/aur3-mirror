# Contributor: kaivalagi <m_buck@hotmail.com>

pkgname=conkyexaile-bzr
pkgver=29
pkgrel=1
pkgdesc="Provides Exaile info, for use in Conky."
arch=('i686' 'x86_64')
url="https://code.launchpad.net/~conky-companions/+junk/conkyexaile"
license=('GPL3')
depends=('python2' 'python-imaging')
makedepends=('bzr')
install=$pkgname.install
source=()
md5sums=()
_bzrbranch=lp:~conky-companions/+junk
_bzrmod=conkyexaile

build() {
  cd $srcdir
  msg "Connecting to the server...."
    
  bzr branch $_bzrbranch/$_bzrmod -q -r $pkgver

  msg "BZR checkout done or server timeout"
  msg "Starting make..."

  [ -d ./${_bzrmod}-build ] && rm -rf ./${_bzrmod}-build
  cp -r ./${_bzrmod} ./${_bzrmod}-build
  cd ./${_bzrmod}-build

  python setup.py build || return 1
  python setup.py install --root=$pkgdir || return 1
  install -D -m644 README $pkgdir/usr/share/conkyexaile/README || return 1
}

package() {
  return 0
}

