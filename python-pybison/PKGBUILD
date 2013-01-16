# Maintainer: TDY <tdy@archlinux.info>

pkgname=python-pybison
pkgver=0.1.8
pkgrel=1
pkgdesc="A Python binding to the Bison (yacc) and Flex (lex) parser-generator utilities"
arch=('i686' 'x86_64')
url="http://freenet.mcnabhosting.com/python/pybison/"
license=('GPL')
depends=('bison' 'flex' 'pyrex')
source=(http://freenet.mcnabhosting.com/python/${pkgname/*-}/${pkgname/*-}-$pkgver.tar.gz)
md5sums=('c57ea56225c205dff1b7291d9a9f1048')

build() {
  cd "$srcdir/${pkgname/*-}-$pkgver"
  python2 setup.py build
}

package() {
  cd "$srcdir/${pkgname/*-}-$pkgver"
  python2 setup.py install --prefix=/usr --root="$pkgdir" --optimize=1
}

# vim:set ts=1 sw=1 et:
