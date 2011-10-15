# See http://wiki.archlinux.org/index.php/VCS_PKGBUILD_Guidelines
# for more information on packaging from Mercurial(hg) sources.

# Maintainer: Your Name <youremail@domain.com>
pkgname=acr-hg
pkgver=44
pkgrel=1
pkgdesc="A fully compatible autoconf replacement" 
arch=('i686' 'x86_64')
url="http://nopcode.org"
license=('GPL')
depends=()
makedepends=('mercurial')
provides=('acr')
conflicts=('acr')

_hgroot="http://hg.youterm.com/"
_hgrepo="acr"

build() {
  cd ${srcdir}
  msg "Connecting to Mercurial server...."

  if [ -d ${_hgrepo} ] ; then
    cd ${_hgrepo}
    hg pull -u
    msg "The local files are updated."
  else
    hg clone ${_hgroot} ${_hgrepo}
  fi

  msg "Mercurial checkout done or server timeout"
  msg "Starting make..."

  rm -rf ${srcdir}/${_hgrepo}-build
  hg clone ${srcdir}/${_hgrepo} ${srcdir}/${_hgrepo}-build
  cd ${srcdir}/${_hgrepo}-build

  ./configure --prefix=/usr
  make
}

package() {
  cd ${srcdir}/${_hgrepo}-build

  make DESTDIR=${pkgdir} install
  cd ${srcdir}
  rm -rf ${_hgrepo}-build
} 
