# Maintainer: Adis Hamzić <adis (at) hamzadis (dot) com>
pkgname=pacvim
_gitname=PacVim
pkgver=20150122
pkgrel=1
pkgdesc="PacVim is a game that teaches you vim commands."
arch=('i686' 'x86_64')
url="https://github.com/jmoon018/PacVim"
license=('GPL')
depends=('ncurses')
makedepends=('git')
provides=(${pkgname})
conflicts=(${pkgname})
source=("git+https://github.com/jmoon018/${_gitname}")
md5sums=('SKIP')

pkgver() {
  cd "${srcdir}/${_gitname}"
  git log -1 --format='%cd' --date=short | tr -d -- '-'
}

prepare() {
  cd "${srcdir}/${_gitname}"

  sed -i 's.mapName = "maps/map".mapName = "/usr/share/'${pkgname}'/maps/map".' "${srcdir}/${_gitname}/src/game.cpp"
}

build() {
  cd "${srcdir}/${_gitname}"
  make
}

package() {
  mkdir -p "${pkgdir}/usr/bin"
  cp "${srcdir}/${_gitname}/pacvim" "${pkgdir}/usr/bin"

  mkdir -p "${pkgdir}/usr/share/${pkgname}/"
  cp -r "${srcdir}/${_gitname}/maps" "${pkgdir}/usr/share/${pkgname}"

  install -D -m644 "${srcdir}/${_gitname}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

