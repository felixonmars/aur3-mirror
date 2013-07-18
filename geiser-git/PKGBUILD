# Maintainer: Neil Santos <nsantos16+aur@gmail.com>
# Contributor: Joachim Fasting <joachim.fasting@gmail.com>
pkgname=geiser-git
pkgver=20131807
pkgrel=1
pkgdesc='A major mode for Emacs-Scheme interaction'
arch=('any')
url='http://www.nongnu.org/geiser/'
license=('BSD')
optdepends=('racket: supported scheme implementation'
  'guile: supported scheme implementation')
depends=('emacs')
makedepends=('automake' 'git' 'emacs')
install=geiser.install
source=()
md5sums=()

_gitroot="http://git.savannah.gnu.org/r/geiser.git"
_gitname="geiser"

build() {
  cd "${srcdir}"

  if [ -d "${srcdir}/${_gitname}/.git" ] ; then
    cd "${_gitname}" && git pull origin || return 1
  else
    git clone "${_gitroot}" || return 1
  fi

  cd "${srcdir}/${_gitname}"
  ./autogen.sh || return 1

  rm -rf "${srcdir}/${_gitname}/build"
  mkdir -p "${srcdir}/${_gitname}/build"
  cd "${srcdir}/${_gitname}/build"

  ../configure --prefix="/usr"
  make all
}

package() {
  cd "${srcdir}/${_gitname}/build"

  make DESTDIR="${pkgdir}" install
  install -D -m644 ../COPYING "${pkgdir}/usr/share/licenses/${pkgname}/COPYING"
}

# vi: set ft=sh ts=2 sw=2 sts=2 :
