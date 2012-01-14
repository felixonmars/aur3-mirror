# Contributor: kaivalagi <m_buck@hotmail.com>

pkgname=sonata-bzr
pkgver=6
pkgrel=1
pkgdesc="Sonata with my own tweaks/fixes"
arch=('i686' 'x86_64')
url="https://code.launchpad.net/~m-buck/+junk/sonata"
license=('GPL3')
depends=('python2')
makedepends=('bzr')
conflicts=('sonata')
source=()
md5sums=()
_bzrbranch=lp:~m-buck/+junk
_bzrmod=sonata

build() {
  cd $srcdir
  msg "Connecting to the server...."
    
  bzr branch $_bzrbranch/$_bzrmod -q -r $pkgver

  msg "BZR checkout done or server timeout"
  msg "Starting make..."

  [ -d ./${_bzrmod}-build ] && rm -rf ./${_bzrmod}-build
  cp -r ./${_bzrmod} ./${_bzrmod}-build
  cd ./${_bzrmod}-build

  python2 setup.py build || return 1
  python2 setup.py install --root=$pkgdir || return 1
}

package() {
  return 0
}

