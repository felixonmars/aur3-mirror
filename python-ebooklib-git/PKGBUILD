# Maintainer: Jonas Heinrich <onny@project-insanity.org>
# Contributor: Jonas Heinrich <onny@project-insanity.org>

pkgname='python-ebooklib-git'
pkgver=0.15.1.g65a30e0
pkgrel=1
pkgdesc="Python E-book library for handling books in EPUB2/EPUB3 and Kindle format"
url="https://github.com/aerkalov/ebooklib"
arch=('any')
license=('AGPL')
depends=('python')
source=('git+https://github.com/aerkalov/ebooklib.git')
sha512sums=('SKIP')

pkgver() {
  cd "$SRCDEST/ebooklib"
  git describe --always | sed 's|-|.|g' | cut -f 2 -d "v"
}

package() {
  cd "$srcdir/ebooklib"
  python setup.py install --root="$pkgdir/"
}

# vim:set ts=2 sw=2 et:
