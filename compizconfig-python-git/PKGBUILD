pkgname=compizconfig-python-git
pkgver=20111203
pkgrel=1
pkgdesc="Compizconfig bindings for python - Latest Git Version"
arch=('i686' 'x86_64')
url="http://compiz.org"
license=('GPL')
provides=('compizconfig-python')
conflicts=('compizconfig-python')
depends=('compiz-core-git' 'libcompizconfig-git' 'glib2' 'python2')
makedepends=('intltool' 'pkgconfig' 'cython2')

_gitroot="git://git.compiz.org/compiz/compizconfig/compizconfig-python/"
_gitname=compizconfig-python

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

  env PKG_CONFIG_PATH="/usr/lib/pkgconfig:$PKG_CONFIG_PATH" \
    python2 setup.py build
}

package() {
  cd "${srcdir}"
  cd "${_gitname}"
  env PKG_CONFIG_PATH="/usr/lib/pkgconfig:$PKG_CONFIG_PATH" \
    python2 setup.py install --prefix="/usr" --root="$pkgdir"
}
