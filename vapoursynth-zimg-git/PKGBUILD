# Maintainer:  Gustavo Alvarez <sl1pkn07@gmail.com>

_plug=zimg
pkgname="vapoursynth-${_plug}-git"
pkgver=20141126.d2e712d
pkgrel=1
pkgdesc="Plugin for Vapoursynth: ${_plug} (GIT version)"
arch=('i686' 'x86_64')
url="http://forum.doom9.org/showthread.php?t=171334"
license=('GPL')
depends=('vapoursynth')
makedepends=('git')
provides=("vapoursynth-plugin-${_plug}")
conflicts=("vapoursynth-plugin-${_plug}")
source=("${_plug}::git+https://github.com/sekrit-twc/zimg.git")
sha1sums=('SKIP')
_gitname="${_plug}"

pkgver() {
  cd "${_gitname}"
  #echo "$(git describe --long --tags | tr - .)"
  echo "$(git log -1 --format="%cd" --date=short | tr -d '-').$(git log -1 --format="%h")"
}

build() {
  cd "${_gitname}"
  ./autogen.sh
  ./configure --prefix=/usr
  make
}

package(){
  make -C "${_gitname}" DESTDIR="${pkgdir}" install
  install -d "${pkgdir}/usr/lib/vapoursynth"
  ln -s ../zimg/vszimg.so "${pkgdir}/usr/lib/vapoursynth/libvszimg.so"
}
