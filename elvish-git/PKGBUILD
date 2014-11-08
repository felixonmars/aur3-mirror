
pkgname=elvish-git
_gitname=elvish
pkgver=0.r804.374c85b
pkgrel=1
pkgdesc='An experimental Unix shell'
license=('BSD-2')
arch=('x86_64' 'i686')
url='https://github.com/xiaq/elvish'
makedepends=('git' 'go')
options=('!strip' '!emptydirs')
install=elvish.install
source=('git+https://github.com/xiaq/elvish.git')
md5sums=('SKIP')

pkgver() {
  cd "${_gitname}"
  printf "0.r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "${_gitname}"
  export GOPATH="${srcdir}/${_gitname}"
  go get github.com/xiaq/elvish
}

package() {
  install -Dm755 "${_gitname}/bin/${_gitname}" "${pkgdir}/usr/bin/${_gitname}"
  install -Dm644 "${_gitname}/src/github.com/xiaq/elvish/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

# vim:set ts=2 sw=2 et:
