# Maintainer: Zachary Vance <vanceza@gmail.com>
pkgname=changed-files-git
_gitname="changed-files"
pkgver=1.b7361a9
pkgrel=1
pkgdesc="List changed files in Arch Linux install files"
arch=('any')
url="https://github.com/vanceza/changed-files"
license=('BSD' 'MIT')
depends=(pacman)
makedepends=(git)
source=("git://github.com/vanceza/changed-files.git")
md5sums=('SKIP') # Git sources aren't static

pkgver() {
  echo $(git rev-list --count HEAD).$(git rev-parse --short HEAD)
}

package() {
    install -d ${pkgdir}/usr/bin
    install -m755 ${srcdir}/$_gitname/$_gitname ${pkgdir}/usr/bin
}
