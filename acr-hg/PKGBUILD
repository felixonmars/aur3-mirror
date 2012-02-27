# See http://wiki.archlinux.org/index.php/VCS_PKGBUILD_Guidelines
# for more information on packaging from Mercurial(hg) sources.

# Maintainer: Your Name <youremail@domain.com>
pkgname=acr-hg
pkgver=46
pkgrel=1
pkgdesc="A fully compatible autoconf replacement" 
arch=('i686' 'x86_64')
url="http://nopcode.org"
license=('GPL')
depends=()
makedepends=('mercurial')
provides=('acr')
conflicts=('acr')

_hgroot="http://hg.youterm.com"
_hgrepo="acr"

build() {
  cd ${srcdir}

  if [ -d ${_hgrepo} ] ; then
    cd ${_hgrepo}
    hg pull -u || true
  else
    hg clone ${_hgroot}/${_hgrepo}
  fi

  cd ${srcdir}
  if [ -d ${_hgrepo}-build ] ; then
    rm -rf ${srcdir}/${_hgrepo}-build
  fi

  hg clone ${_hgrepo} ${_hgrepo}-build
  cd ${_hgrepo}-build

  ./configure --prefix=/usr
  make
}

package() {
  cd ${srcdir}/${_hgrepo}-build

  make DESTDIR=${pkgdir} install
  cd ${srcdir}
  rm -rf ${_hgrepo}-build
} 
