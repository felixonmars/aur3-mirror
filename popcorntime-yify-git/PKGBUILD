# Maintainer: Iwan Timmer <irtimmer@gmail.com>
# Contributor: Eric Engestrom <aur [at] engestrom [dot] ch>

pkgname=popcorntime-yify-git
pkgver=r716.cc41079
pkgrel=1
pkgdesc="Stream movies from torrents. Skip the downloads. Launch, click, watch."
arch=('i686' 'x86_64')
url="https://github.com/Yify/popcorn-site"
license=('GPLv3')
depends=('alsa-lib' 'gconf' 'gtk2' 'nss' 'libudev.so.0')
makedepends=('git' 'nodejs' 'nodejs-grunt-cli' 'ruby-compass-alpha')
conflicts=('popcorntime', 'popcorntime-beta', 'popcorntime-git')
options=('!strip')
_gitname=popcorn-app
source=("git+https://github.com/Yify/${_gitname}")
md5sums=('SKIP')

pkgver() {
  cd "${srcdir}/${_gitname}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "${srcdir}/${_gitname}"
  npm install
  grunt build
}

package() {
  cd "${srcdir}/${_gitname}/build/releases/Popcorn-Time"

  if [[ "$CARCH" == "i686" ]]
  then
    cd "linux32"
  elif [[ "$CARCH" == "x86_64" ]]
  then
    cd "linux64"
  else
    error "Incompatible architecture: $CARCH"
    return 1
  fi

  cd "Popcorn-Time"

  # Program
  local _OPT="/opt/popcorn-time"
  mkdir -p "${pkgdir}${_OPT}"
  install -m755 "Popcorn-Time" "${pkgdir}${_OPT}"
  install -m744 "nw.pak" "${pkgdir}${_OPT}"
  install -m755 "libffmpegsumo.so" "${pkgdir}${_OPT}"

  # Link to program
  mkdir -p "${pkgdir}/usr/bin"
  ln -s "${_OPT}/Popcorn-Time" "${pkgdir}/usr/bin/"

  # License
  install -Dm644 "${srcdir}/${_gitname}/LICENSE.txt" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
