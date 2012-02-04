# Maintainer: Philipp Überbacher <murks at lavabit dot com>
pkgname=tschack-git
pkgver=20111209
pkgrel=1
pkgdesc="Jack 1 experimental development branch"
arch=('i686' 'x86_64')
url="http://hochstrom.endofinternet.org/trac/tschack/"
license=('GPL')
depends=('readline' 'libsamplerate')
makedepends=('doxygen' 'git')
provides=('jack')
conflicts=('jack')
options=(!libtool)

_gitroot="git://hochstrom.endofinternet.org/jack.git"
_gitname="tschack"
_gitbranch="tschack"

build() {
  cd "${srcdir}"
  msg "Connecting to GIT server...."

  if [ -d ${_gitname} ] ; then
    cd ${_gitname} && git pull origin
    msg "The local files are updated."
  else
    git clone ${_gitroot} ${_gitname}
  fi

  msg "GIT checkout done or server timeout"
  msg "Starting make..."

  rm -rf "${srcdir}/${_gitname}-build"
  cp -r "${srcdir}/${_gitname}" "${srcdir}/${_gitname}-build"

  cd "${srcdir}/${_gitname}-build"
  git checkout --track -b ${_gitbranch} origin/${_gitbranch}

  #
  # BUILD HERE
  #

  ./autogen.sh
  ./configure --prefix=/usr --libdir=/usr/lib --mandir=/usr/share/man
  make
  make DESTDIR="${pkgdir}/" install
} 
