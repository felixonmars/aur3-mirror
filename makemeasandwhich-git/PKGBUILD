# Maintainer: HER0_01 <aconrad103 at gmail.com>

pkgname=makemeasandwhich-git
pkgver=33.4d79aab
pkgrel=1
pkgdesc="Orders from Jimmy John's via command line, inspired by xkcd 149"
arch=('i686' 'x86_64')
url="https://github.com/travist/makemeasandwich.js"
license=('MIT')
depends=('nodejs' 'phantomjs')
provides=('makemeasandwhich' 'makemeasandwhich-git')
conflicts=('makemeasandwhich')
source=("$pkgname::git://github.com/travist/makemeasandwich.js")
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/$pkgname"
  echo $(git rev-list --count master).$(git rev-parse --short master)
}

package() {
  cd "$srcdir/$pkgname"
  mkdir "$pkgdir/usr"
  npm install --user root -g --prefix="$pkgdir/usr"
  install -D -m644 LICENSE.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE.txt"
}
