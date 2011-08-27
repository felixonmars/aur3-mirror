# Maintainer: Philipp Überbacher <hollunder at gmx dot at>
pkgname=epichord-git
pkgver=20101206
pkgrel=1
pkgdesc="Jack-Midi Sequencer using FLTK"
url="http://evanr.infinitymotel.net/epichord/"
arch=('i686' 'x86_64')
license=('GPL')
depends=('jack' 'fltk2')
makedepends=('git')
md5sums=()
source=(disable_lash.patch)
md5sums=('989f0e1d553fe761a893776ba9bb8c45')

_gitroot="git://repo.or.cz/epichord.git"
_gitname="epichord"

build() {
  cd "${srcdir}"
  if [ -d ${srcdir}/${_gitname} ] ; then
  cd ${_gitname} && git pull origin
  msg "The local files are updated."
  else
  msg "cloneing git repo"
  git clone ${_gitroot}
  msg "git repo cloned, maybe..."
  fi

  msg "GIT checkout done or server timeout, srcdir is:"${srcdir}
  msg "Starting make..."

  cp -r "${srcdir}/${_gitname}" "${srcdir}/${_gitname}-build"
  cd "${srcdir}/${_gitname}-build"
  
  #epichord doesn't build with lash 0.6.0~rc2 at least
  patch -p3 < ${srcdir}/disable_lash.patch
  
  ./autogen.sh
  ./configure --prefix="/usr"
  make
}

package() {
  cd "${srcdir}/${_gitname}-build"
  make DESTDIR="${pkgdir}" install
}
