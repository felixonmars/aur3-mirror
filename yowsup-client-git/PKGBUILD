# Maintainer: Jonas Heinrich <onny@project-insanity.org>
# Contributor: Jonas Heinrich <onny@project-insanity.org>

pkgname='yowsup-client-git'
pkgver=b7c606c
pkgrel=1
pkgdesc="yowsup-cli is a command line interface to Yowsup library"
url="https://github.com/tgalal/yowsup"
arch=('any')
license=('MIT')
depends=('python' 'python-yowsup-git')
source=('git+https://github.com/tgalal/yowsup'
        'setup.py')
sha512sums=('SKIP'
            '5cb0bd3f235b5a65a1ebf844f879c8ba044a5c30133a1a1cbb458f748f0aedab33af9917ac396be5d785c0a6f6469ee677f76de0900e519642b9843d1924b4b6')

pkgver() {
  cd "$SRCDEST/yowsup"
  git describe --always | sed 's|-|.|g'
}

package() {
  cd "$srcdir/yowsup"
  cp "$srcdir/setup.py" .
  mv src/Examples src/YowsupCli
  sed -i 's/Examples/YowsupCli/g' src/yowsup-cli
  python setup.py install --root="$pkgdir/"
  chmod +x $pkgdir/usr/bin/yowsup-cli
}

# vim:set ts=2 sw=2 et:
