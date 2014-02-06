# Maintainer: qs9rx < that nick at enjoys dÃƒÂ¶t it>

pkgname=tyrutils-git
pkgver=0.r598.88db6a7
pkgrel=1
pkgdesc="Tyrann's Quake Utilities. Git version"
arch=('i686' 'x86_64')
url="http://disenchant.net/utils/"
license=('GPL2')
depends=('glibc')
makedepends=('git')
md5sums=('SKIP')

source=('git://disenchant.net/tyrutils')
_gitname="tyrutils"

pkgver() {
  cd $_gitname
  printf "0.r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd $_gitname

  make
}

package() {
  cd $_gitname
  mkdir -p ${pkgdir}/usr/bin
  install -m755 bin/* ${pkgdir}/usr/bin/
  install -Dm644 COPYING ${pkgdir}/usr/share/licenses/${pkgname}/COPYING
}