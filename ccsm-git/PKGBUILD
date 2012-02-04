pkgname=ccsm-git
pkgver=20110827
pkgrel=1
pkgdesc="Compizconfig Settings Manager in Python - Latest Git Version"
arch=('any')
url="http://compiz.org"
install="ccsm-git.install"
license=('GPL')
provides=('ccsm')
conflicts=('ccsm')
depends=('compiz-core-git' 'compizconfig-python-git' 'pygtk')
source=(
  'ccsm-git.install'
)
sha512sums=(
  '1a65480d6be555c4524001d60371e1de213f729d0a2b9a351d1d98ce08672f317f12739ac1170ef44e1aa1eeb0b6f6c6a26a2565411b5ce9b268e2577920aac3'
)

_gitroot="git://git.compiz.org/compiz/compizconfig/ccsm/"
_gitname=ccsm

build() {
  cd "${srcdir}"
  msg "Connecting to GIT server...."

  if [[ -d "${_gitname}" ]]; then
    cd "${_gitname}" && git pull origin
    msg "The local files are updated."
  else
    git clone "${_gitroot}" "${_gitname}"
    cd "${_gitname}"
  fi

  python2 setup.py build --prefix="/usr"
}

package() {
  cd "${srcdir}"
  cd "${_gitname}"
  python2 setup.py install --prefix="/usr" --root="${pkgdir}"
}
