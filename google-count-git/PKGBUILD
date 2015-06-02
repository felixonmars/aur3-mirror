# Maintainer: Zachary Vance <vanceza@gmail.com>
pkgname=google-count-git
_gitname="google-count"
pkgver=1.d3018de
pkgrel=1
pkgdesc="Show the number of results on Google"
arch=('any')
url="git+https://github.com/vanceza/google-count"
license=('BSD' 'MIT')
# Or python2, python2-beautifulsoup3
depends=(python python-beautifulsoup4)
makedepends=(git)
source=("$pkgname::git+https://github.com/vanceza/google-count.git")
md5sums=('SKIP') # Git sources aren't static

pkgver() {
  cd $pkgname
  echo $(git rev-list --count HEAD).$(git rev-parse --short HEAD)
}

package() {
    install -d ${pkgdir}/usr/bin
    install -m755 ${srcdir}/$_gitname/google-count.py ${pkgdir}/usr/bin/google-count
}
