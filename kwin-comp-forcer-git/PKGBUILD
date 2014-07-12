# Maintainer: Alfred Neumayer <dev.beidl@gmail.com>
pkgname=kwin-comp-forcer-git
pkgver=25806cc
pkgrel=1
pkgdesc="Disable KWin compositing based on your secondary NVidia card."
arch=('i686' 'x86_64')
url="https://github.com/beidl/kwin-comp-forcer"
license=('GPL2')
depends=('qt5-base' 'bbswitch')
makedepends=('qt5-base' 'gcc' 'git')
source=("git://github.com/beidl/kwin-comp-forcer.git")
md5sums=('SKIP')

pkgver() {
  cd kwin-comp-forcer
  printf "%s" "$(git rev-parse --short HEAD)"
}

build() {
  cd kwin-comp-forcer
  qmake
  make
}

package() {
  mkdir -p "${pkgdir}"/usr/bin
  cd kwin-comp-forcer
  cp kwin-comp-forcer "${pkgdir}"/usr/bin
  chmod 755 "${pkgdir}"/usr/bin/kwin-comp-forcer
}
