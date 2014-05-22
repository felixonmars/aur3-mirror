# Maintainer: Teo Mrnjavac <teo@kde.org>

_pkgname=als
pkgname=${_pkgname}-driver-git
pkgver=20140521
pkgrel=1
pkgdesc="ASUS Zenbook ambient light sensor kernel module."
arch=('i686' 'x86_64')
url="https://github.com/danieleds/als"
license=('GPL2')
makedepends=('git' 'linux-headers')
provides=('als-driver')
conflicts=('als-driver')
install='als-driver.install'

_gitroot=git://github.com/danieleds/als.git
_gitname=als

build() {
  cd "$srcdir"
  msg "Connecting to GIT server...."

  if [[ -d "${_gitname}" ]]; then
    cd "${_gitname}" && git pull origin
    msg "The local files are updated."
  else
    git clone "${_gitroot}" "${_gitname}"
  fi

  msg "GIT checkout done or server timeout"
  msg "Starting build..."

  rm -rf "$srcdir/${_gitname}-build"
  git clone "$srcdir/${_gitname}" "$srcdir/${_gitname}-build"
  cd "$srcdir/${_gitname}-build"

  make
}

package() {
  cd "$srcdir/${_gitname}-build/"
  mkdir -p "$pkgdir/lib/modules/$(uname -r)/extramodules/"
  install -D als.ko "$pkgdir/lib/modules/$(uname -r)/extramodules/"
}

# vim:set ts=2 sw=2 et:
