# Maintainer:  Gustavo Alvarez <sl1pkn07@gmail.com>

_plug=example_plugins
pkgname=vapoursynth-plugin-${_plug}-git
pkgver=20131221.94d8a3e
pkgrel=1
pkgdesc="Plugin for Vapoursynth: ${_plug} (GIT Version)"
arch=('i686' 'x86_64')
url="http://forum.doom9.org/showthread.php?t=166147"
license=('GPL')
depends=('vapoursynth')
makedepends=('git')
provides=("vapoursynth-plugin-${_plug}")
conflicts=("vapoursynth-plugin-${_plug}")
source=("${_plug}::git+https://github.com/sekrit-twc/VSExamples.git"
        'Makefile')
sha1sums=('SKIP'
          'f41ca3e9f0040391cae80e45ec612e8891eceaa5')
_gitname="${_plug}"

pkgver() {
  cd "${_gitname}"
  echo "$(git log -1 --format="%cd" --date=short | tr -d '-').$(git log -1 --format="%h")"
}

prepare() {
  cd "${_gitname}"
  cp -R ../Makefile .
  rm VSExamples/{VapourSynth,VSHelper}.h
}

build() {
  cd "${_gitname}"
  make
}

package(){
  cd "${_gitname}"
  make DESTDIR="${pkgdir}/" install
  install -Dm644 matrix_conversions.txt "${pkgdir}/usr/share/doc/vapoursynth/plugins/${_plug}/matrix_conversions.txt"
}
