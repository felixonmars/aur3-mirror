# Maintainer: Vincent Petithory <vincent.petithory at gmail dot com>

pkgname=mpdfav-git
pkgver=r35.d7bc190
pkgrel=1
pkgdesc='Song playcounts and ratings for MPD'
arch=('x86_64' 'i686' 'ARM')
url='https://github.com/vincent-petithory/mpdfav'
license=('GPL3')
makedepends=('go' 'git')
depends=('sqlite')
optdepends=('mpd: for mpdfav to have a purpose')
options=('!strip' '!emptydirs')
source='git+https://github.com/vincent-petithory/mpdfav.git'
md5sums=('SKIP')
_gourl='github.com/vincent-petithory/mpdfav'

pkgver() {
  cd "$srcdir/mpdfav"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  p="$(dirname "${srcdir}/src/${_gourl}")"
  mkdir -p "$p"
  mv "$srcdir/mpdfav" "$p"
  export GOPATH="$srcdir"
  go get -v "${_gourl}/..."
  go install "${_gourl}/..."
}

package() {
  for b in mpdfavd mpdfav-import; do
    install -D -m755 "${srcdir}/bin/${b}" "${pkgdir}/usr/bin/${b}"
  done
  install -D -m644 "${srcdir}/src/${_gourl}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
