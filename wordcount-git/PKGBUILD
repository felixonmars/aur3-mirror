# Maintainer: Zachary Vance <vanceza@gmail.com>
pkgname=wordcount-git
_gitname="wordcount"
pkgver=0.0.0
pkgrel=1
pkgdesc="Count the number of words in a file"
arch=('any')
url="https://github.com/vanceza/wordcount"
license=('BSD' 'MIT')
depends=()
makedepends=(git)
source=("git://github.com/vanceza/wordcount.git")
md5sums=('SKIP') # Git sources aren't static

pkgver() {
  cd local_repo
  echo $(git rev-list --count HEAD).$(git rev-parse --short HEAD)
}

package() {
    install -d ${pkgdir}/usr/bin
    install -m755 ${srcdir}/$_gitname/$_gitname ${pkgdir}/usr/bin
}
