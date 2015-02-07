# Maintainer:  BlackLotus    <maxmusterm@gmail.com>
# Contributor: almostalive   <almostalive2003 at gmail dot com>
# Contributor: Themaister    <maister@archlinux.us>

pkgname=retroarch-rbp-git
pkgver=16153
pkgrel=1
pkgdesc="Reference frontend for the libretro API."
arch=('arm' 'armv6h' 'armv7h')
url="http://github.com/libretro/RetroArch"
license=('GPL')
optdepends=('libretro-super-git: A collection of many libretro implementations.')
makedepends=('git')
provides=('retroarch' 'retroarch-git')
conflicts=('retroarch')

_gitname=RetroArch
source=("git+https://github.com/libretro/${_gitname}.git")
md5sums=('SKIP')

pkgver() {
  cd "${_gitname}"
  echo $(git rev-list --count HEAD).$(git rev-parse --short HEAD)
}

build() {
  cd "${_gitname}"
  ./configure --prefix=/usr
  make
}

package() {
  cd "${_gitname}"
  make install DESTDIR="${pkgdir}"
}
