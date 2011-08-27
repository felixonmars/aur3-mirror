# Maintainer: Sian Cao <sycao@redflag-linux.com>

pkgname=go-opengl-git
pkgver=20110822
pkgrel=1
pkgdesc="Go bindings for OpenGL "
arch=('i686' 'x86_64')
url="http://github.com/banthar/Go-OpenGL"
license=('custom')
depends=('go' 'sdl' 'go-sdl-git')
makedepends=('git')
options=('!strip')
_gitroot="git://github.com/banthar/Go-OpenGL.git"
_gitname="Go-OpenGL"

build() {
  msg 'Connecting to GIT server...'

  if [[ -d $_gitname ]]; then
    ( cd $_gitname && git pull origin )
    msg 'The local files are updated.'
  else
    git clone $_gitroot
  fi

  msg 'GIT checkout done or server timeout'
  msg 'Starting make...'

  rm -rf $_gitname-build
  git clone $_gitname{,-build}

  cd ${_gitname}-build
  gomake gl
}

package() {
  cd ${srcdir}/${_gitname}-build
  mkdir -p ${pkgdir}/${GOROOT}/src
  cp -v ${GOROOT}/src/Make.* ${pkgdir}/${GOROOT}/src/
  GOROOT=${pkgdir}/${GOROOT} gomake install
  rm -f ${pkgdir}/${GOROOT}/src/Make.*
}

# vim: set ts=2 sw=2 et:
