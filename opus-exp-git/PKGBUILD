# Maintainer: Jonathan Liu <net147@gmail.com>
pkgname=opus-exp-git
pkgver=20120824
pkgrel=1
pkgdesc="Codec designed for interactive speech and audio transmission over the Internet (exp_analysis7 branch)"
arch=('i686' 'x86_64')
url="http://www.opus-codec.org/"
license=('BSD')
depends=('glibc')
options=('!libtool')
provides=('opus')
conflicts=('opus')

_gitroot=git://git.opus-codec.org/opus.git
_gitname=opus

build(){
  cd "${srcdir}"
  msg "Connecting to GIT server...."

  if [[ -d "${_gitname}" ]]; then
    cd "${_gitname}" && git pull origin
    msg "The local files are updated."
  else
    git clone -b exp_analysis7 "${_gitroot}" "${_gitname}"
  fi

  msg "GIT checkout done or server timeout"
  msg "Starting build..."

  rm -rf "${srcdir}/${_gitname}-build"
  git clone "${srcdir}/${_gitname}" "${srcdir}/${_gitname}-build"
  cd "${srcdir}/${_gitname}-build"

  ./autogen.sh
  ./configure --prefix=/usr
  make
}

package() {
  cd "${srcdir}/${_gitname}-build"
  make DESTDIR="${pkgdir}" install
  install -D -m644 COPYING "${pkgdir}/usr/share/licenses/${pkgname}/COPYING"
}
