# Maintainer: Zachary Vance <vanceza@gmail.com>
pkgname=export-chrome-bookmarks-git
_gitname="export-chrome-bookmarks"
pkgver=1.fb6f388
pkgrel=1
pkgdesc="Print chrome bookmarks in line-delimited format"
arch=('any')
url="https://github.com/vanceza/export-chrome-bookmarks"
license=('BSD' 'MIT')
depends=()
optdepends=(chromium)
makedepends=(git)
source=("git://github.com/vanceza/export-chrome-bookmarks.git")
md5sums=('SKIP') # Git sources aren't static

pkgver() {
  echo $(git rev-list --count HEAD).$(git rev-parse --short HEAD)
}

package() {
    install -d ${pkgdir}/usr/bin
    install -m755 ${srcdir}/$_gitname/$_gitname ${pkgdir}/usr/bin
}
