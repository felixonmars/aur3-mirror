# Maintainer: Tetsumaki <http://goo.gl/YMBdA>

pkgname=fail0verflow-git
pkgver=20110104
pkgrel=1
pkgdesc="Do not use this package, use : fail0verflow-ps3tools-git"
arch=('i686' 'x86_64')
url="http://www.fail0verflow.com/"
license=('GPLv2')
conflicts=('fail0verflow-ps3tools-git')
makedepends=('git')
optdepends=('ps3-sfo-editor' 'fwtool-git')

_gitroot="git://git.fail0verflow.com/ps3tools.git"
_gitname="ps3tools"

build() {
  cd "${srcdir}"

  if [ -d ${_gitname} ]; then
    cd "${_gitname}" && git pull origin
  else
    git clone $_gitroot
  fi

  rm -rf "${srcdir}/${_gitname}-build"
  git clone --depth 1 "${srcdir}/${_gitname}" "${srcdir}/${_gitname}-build"
  cd "${srcdir}/${_gitname}-build"

  make
}

package() {
  cd "${srcdir}/${_gitname}-build"

  for src in `ls`; do
    case `file -b --mime-type "${src}"` in
      "application/x-executable")
        install -D -m755 "./${src}" "${pkgdir}/usr/bin/f0f-${src}";;
    esac
  done
}
