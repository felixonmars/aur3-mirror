# Maintainer: Gustavo Alvarez <sl1pkn07@gmail.com>

pkgname=nut-multimedia
pkgver=20130127
pkgrel=1
pkgdesc="free multimedia container format"
arch=('i686' 'x86_64')
url="http://wiki.multimedia.cx/index.php?title=NUT"
license=('GPL')
makedepends=('git')

_gitroot="git://git.ffmpeg.org/nut.git"
_gitname="nut"

build() {
  cd "${srcdir}"
  msg "Connecting to the Git repository..."

  if [ -d "${_gitname}" ] ; then
    cd "${_gitname}" && git pull origin
  else
    git clone "${_gitroot}"
  fi

  msg "Git clone done"
  msg "Starting make..."

  rm -rf "${srcdir}/${_gitname}-build"
  cp -R "${srcdir}/${_gitname}" "${srcdir}/${_gitname}-build"
  cd "${srcdir}/${_gitname}-build/src/trunk"

  sed 's|/local||' -i config.mak
  CFLAGS+="-fPIC" make libnut/libnut.so
  make nututils
}

package() {
  cd "${srcdir}/${_gitname}-build/src/trunk"
  make DESTDIR="${pkgdir}" install-libnut-shared
  make DESTDIR="${pkgdir}" install-nututils
}