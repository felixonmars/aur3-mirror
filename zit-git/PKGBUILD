# Maintainer: Mike Swanson <mikeonthecomputer@gmail.com>

pkgname=zit-git
pkgver=33.ga956bb3
pkgrel=1
pkgdesc="Use Git to track single files, like RCS"
arch=('any')
url="https://github.com/chungy/zit"
license=('none')
depends=('git')
makedepends=('asciidoc')
source=(git://github.com/chungy/zit.git)
md5sums=('SKIP')

pkgver() {
  cd ${pkgname/-git/}
  local rev_count=$(git rev-list --count HEAD)
  local head_commit=$(git log -1 --pretty=format:%h)
  echo ${rev_count}.g${head_commit}
}

build() {
  cd ${pkgname/-git/}

  make
}

package() {
  cd ${pkgname/-git/}

  make prefix=/usr DESTDIR="${pkgdir}" install
}

# vim:set ts=2 sw=2 et:
