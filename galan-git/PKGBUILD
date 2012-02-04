# Maintainer: Philipp Überbacher <hollunder at gmx dot at>
pkgname=galan-git
pkgver=20090702
pkgrel=1
pkgdesc="Graphical Audio Language"
arch=('i686' 'x86_64')
url="http://galan.sourceforge.net/"
license=('GPL')
depends=('liblrdf' 'libvorbis' 'lash' 'esound' 'libgnomecanvas')
makedepends=('git')
provides=('galan')
options=('!libtool')
md5sums=()

_gitroot="git://repo.or.cz/galan.git"
_gitname="galan"

build() {
  cd "${srcdir}"
  msg "Connecting to GIT server...."

  if [ -d ${_gitname} ] ; then
    cd ${_gitname} && git pull origin
    msg "The local files are updated."
  else
    git clone ${_gitroot}
  fi

  msg "GIT checkout done or server timeout"
  msg "Starting make..."

  rm -rf "${srcdir}/${_gitname}-build"
  git clone "${srcdir}/${_gitname}" "${srcdir}/${_gitname}-build"
  cd "${srcdir}/${_gitname}-build"


  ./autocvs || return 1
  ./configure --prefix="/usr" || return 1
  make || return 1
  make DESTDIR="${pkgdir}" install || return 1
}
