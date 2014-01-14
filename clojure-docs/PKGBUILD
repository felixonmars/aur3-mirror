# Maintainer: Lauri Hakko <lauri dot hakko at gmail dot com>

pkgname=clojure-docs
pkgver=1.5.1
pkgrel=2
pkgdesc="Set of HTML documentation for clojure"
arch=('any')
url="https://github.com/clojure/clojure/tree/gh-pages"
license=('EPL')
depends=()
options=('docs')
source=("git+https://github.com/clojure/clojure.git#branch=gh-pages")
md5sums=('SKIP')

package() {
  mkdir -p $pkgdir/usr/share/doc/clojure/html
  cp -rf $srcdir/clojure/* $pkgdir/usr/share/doc/clojure/html/
  find $pkgdir/usr/share/doc/clojure/html/ -type f -exec chmod 0644 {} \;
  find $pkgdir/usr/share/doc/clojure/html/ -type d -exec chmod 0755 {} \;
}
