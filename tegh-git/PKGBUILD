# Maintainer: Rob Gilson <d1plo1d@d1plo1d.com>
pkgname=tegh-git
_gitname=tegh
pkgver=61.de91351
pkgrel=2
pkgdesc="A command line client to remotely monitor and control 3D printers running Prontserve."
url="https://github.com/D1plo1d/tegh"
arch=('any')
license=('MIT')
depends=('nodejs' 'coffee-script')
optdepends=()
makedepends=()
conflicts=()
replaces=()
backup=()
source=("git+https://github.com/D1plo1d/tegh.git#branch=develop")
sha256sums=('SKIP')

pkgver() {
  cd $_gitname
  echo $(git rev-list --count HEAD).$(git rev-parse --short HEAD)
}

build() {
  cd "${srcdir}/${_gitname}"
  npm install
}

package() {
  install -dm755 ${pkgdir}/usr/{bin,share/tegh/{src,node_modules}}
  cp -R "${srcdir}/${_gitname}/src" "${pkgdir}/usr/share/tegh/"
  cp -R "${srcdir}/${_gitname}/node_modules" "$pkgdir/usr/share/tegh/"
  install -Dm644 "${srcdir}/${_gitname}/package.json" "$pkgdir/usr/share/tegh/package.json"

  echo -e "#!/bin/sh\n/usr/bin/env coffee /usr/share/tegh/src/tegh.coffee\n" > "${pkgdir}/usr/bin/tegh"
  chmod 755 "${pkgdir}/usr/bin/tegh"
}