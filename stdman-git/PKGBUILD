# Maintainer: Nathan Typanski <ndt@nathantypanski.com>

_srcname=stdman
_github_owner=jeaye
pkgname=stdman-git
pkgver=r61.b0fa9f9
pkgrel=1
pkgdesc="generate man pages from cppreference html."
arch=('i686' 'x86_64')
url="https://github.com/${_github_owner}/${_srcname}"
license=('MIT')
makedepends=()
options=()
source=("git://github.com/${_github_owner}/${_srcname}.git")
md5sums=('SKIP')
sha256sums=('SKIP')

pkgver() {
  cd "${srcdir}/${_srcname}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "${srcdir}/${_srcname}"
  ./configure --prefix='/usr' && make
}

package() {
  cd "${srcdir}/${_srcname}"
  make stdman
  install -D -m777 'bin/stdman' "${pkgdir}/bin/stdman"
}

