# Contributor: Lex Black <autumn-wind at web dot de>
# Contributor: Fotis 'NlightNFotis' Koutoulakis <fotis.koutoulakis@gmail.com>

_pkgname=llvmpy
pkgname=llvm-py
pkgver=0.12.7
pkgrel=1
pkgdesc="Python Bindings for LLVM"
url="http://www.llvmpy.org"
arch=('i686' 'x86_64')
license=('custom:BSD')
depends=('llvm-crack' 'python')
# llvm-crack just for the fact, that it's llvm3.3
source=(http://pypi.python.org/packages/source/l/$_pkgname/$_pkgname-$pkgver.tar.gz)
md5sums=('7b12ec9b0080c492342c51594b308bd9')


build() {
  cd $_pkgname-$pkgver

  python setup.py build
}

package() {
  cd $_pkgname-$pkgver

  python setup.py install \
    --prefix=/usr \
    --root=$pkgdir #\
    #--llvm-config=$(which llvm-config)
}
