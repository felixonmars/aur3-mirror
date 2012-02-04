# Maintainer: Rémy Oudompheng <remy@archlinux.org>

pkgname=go-sdl-git
pkgver=20101216
pkgrel=1
pkgdesc="Go bindings for SDL "
arch=('i686' 'x86_64')
url="http://github.com/banthar/Go-SDL"
license=('custom')
depends=('go' 'sdl' 'sdl_image' 'sdl_mixer' 'sdl_ttf')
makedepends=('git')
options=('!strip')
_gitroot="git://github.com/banthar/Go-SDL.git"
_gitname="Go-SDL"

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
  gomake
}

package() {
  cd ${srcdir}/${_gitname}-build
  mkdir -p ${pkgdir}/${GOROOT}/src
  cp -v ${GOROOT}/src/Make.* ${pkgdir}/${GOROOT}/src/
  GOROOT=${pkgdir}/${GOROOT} gomake install
  rm -f ${pkgdir}/${GOROOT}/src/Make.*
}

# vim: set ts=2 sw=2 et:
