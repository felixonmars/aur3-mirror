pkgname=utouch-geis-bzr
pkgver=274
pkgrel=1
pkgdesc="Implementation of the GEIS (Gesture Engine Interface and Support) interface."
arch=('i686' 'x86_64')
url="https://launchpad.net/utouch-geis"
license=('GPL' 'LGPL')
depends=('utouch-grail-bzr')
makedepends=('xorg-server-devel' 'bzr')
provides=('utouch-geis')
conflicts=('utouch-geis')

_bzrtrunk=lp:utouch-geis
_bzrmod=utouch-geis

build() {
  cd "${srcdir}"

  if [ -d ${_bzrmod} ]; then
    bzr up ${_bzrmod}
    msg "The local files are updated."
  else
    bzr co ${_bzrtrunk} ${_bzrmod}
  fi

  cd "${srcdir}/${_bzrmod}"
  PYTHON2VER=$(ls -l /usr/bin/python2 2>&1 | sed 's/^.*\(.\..\)/\1/g')
  ./autogen.sh
  sed -i "/python >= ${PYTHON2VER}/s/python \(>= .\..\)/python-${PYTHON2VER} \1/g" configure
  PYTHON=/usr/bin/python2 ./configure --prefix=/usr
  make
}

package() {
  cd "${srcdir}/${_bzrmod}"
  make DESTDIR="${pkgdir}" install
}

