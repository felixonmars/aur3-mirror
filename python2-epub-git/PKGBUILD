# Maintainer: Daniel Wallace < daniel.wallace at gatech dot edu>
pkgname=python2-epub-git
_pkgname=epub
pkgver=25.96dcc0a
epoch=1
pkgver(){
    cd $_pkgname
    echo $(git rev-list --count HEAD).$(git describe --always)
}
pkgrel=1
pkgdesc="python/curses epub reader. Requires BeautifulSoup"
arch=('any')
url="https://github.com/rupa/epub"
license=('GPL')
depends=(python2-beautifulsoup3 python2-fabulous python-imaging readline)
makedepends=('git' 'python2-distribute')

source=("$_pkgname::git+https://github.com/rupa/epub.git")
md5sums=('SKIP')

build() {
  cd "$srcdir/$_pkgname"
  sed -i 's:#\!/usr/bin/env python:&2:' $srcdir/$_pkgname/epub.py

}

package() {
  cd "$srcdir/$_pkgname"
  install -Dm777 "$_pkgname.py" "$pkgdir/usr/bin/$_pkgname"
}

# vim:set ts=2 sw=2 et:
