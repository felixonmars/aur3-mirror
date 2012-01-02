# Contributor: kaivalagi <m_buck@hotmail.com>

pkgname=gtk-desktop-info-data-bzr
pkgver=13
pkgrel=1
pkgdesc="Provides images and locale files which the gtk-desktop-info-bzr package is dependant on."
arch=('i686' 'x86_64')
url="https://code.launchpad.net/~m-buck/+junk/gtk-desktop-info-data"
license=('GPL3')
depends=()
makedepends=('bzr')
install=$pkgname.install
source=()
md5sums=()
_bzrbranch=lp:~m-buck/+junk
_bzrmod=gtk-desktop-info-data

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
}

package() {
  return 0
}
