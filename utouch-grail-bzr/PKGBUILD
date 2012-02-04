pkgname=utouch-grail-bzr
pkgver=166
pkgrel=1
pkgdesc="Gesture Recognition And Instantiation Library"
arch=('i686' 'x86_64')
url="https://launchpad.net/utouch-grail"
license=(GPL)
depends=('mtdev' 'utouch-evemu-bzr' 'utouch-frame-bzr')
makedepends=('bzr')
provides=('utouch-grail')
conflicts=('utouch-grail')

source=()

sha512sums=()

_bzrtrunk=lp:utouch-grail
_bzrmod=utouch-grail

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
  ./configure --prefix=/usr
  make
}

package() {
  cd "${srcdir}/${_bzrmod}"
  make DESTDIR="$pkgdir" install
}

