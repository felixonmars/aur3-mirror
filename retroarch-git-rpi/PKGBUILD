# Maintainer:  Patrick Ulbrich <zulu99@gmx.net>
# Contributor: prettyvanilla <prettyvanilla@posteo.at>
# Contributor: almostalive   <almostalive2003 at gmail dot com>
# Contributor: Themaister    <maister@archlinux.us>

pkgname=retroarch-git-rpi
pkgver=8330.2787345
pkgrel=2
pkgdesc="Reference frontend for the libretro API. This package is optimized for the Raspberry Pi."
arch=('armv6h')
url="http://github.com/libretro/RetroArch"
license=('GPL')
# optional build-time deps: 'openal', 'libxml2', 'nvidia-cg-toolkit', 'sdl_image'
# see: 'retroarch --features' for more.
depends=('libgl' 'alsa-lib')
optdepends=('libretro-super-git: A collection of many libretro implementations.')
makedepends=('git' 'raspberrypi-firmware')
provides=('retroarch')
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
  ./configure --prefix=/usr --disable-x11 --disable-oss --disable-pulse --enable-floathard --enable-alsa
  make
}

package() {
  cd "${_gitname}"
  make install DESTDIR="${pkgdir}"
}
