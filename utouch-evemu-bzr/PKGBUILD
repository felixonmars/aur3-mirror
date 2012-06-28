pkgname=utouch-evemu-bzr
pkgver=55
pkgrel=1
pkgdesc="Event Emulation for the uTouch Stack"
arch=('i686' 'x86_64')
url="https://launchpad.net/utouch-evemu"
license=('GPL')
depends=()
makedepends=('bzr')
provides=('utouch-evemu')
conflicts=('utouch-evemu')
source=()
options=('!libtool')
sha512sums=()

_bzrtrunk=lp:utouch-evemu
_bzrmod=utouch-evemu

build() {
  cd "${srcdir}"

  if [ -d ${_bzrmod} ]; then
    bzr up ${_bzrmod}
    msg "The local files are updated."
  else
    bzr co ${_bzrtrunk} ${_bzrmod}
  fi

  cd "${srcdir}/${_bzrmod}"
  ./autogen.sh
  PYTHON=python2 ./configure --prefix=/usr
  MAKEFLAGS="-j1"
  make
}

package() {
  cd "${srcdir}/${_bzrmod}"
  make DESTDIR="${pkgdir}" install
}

