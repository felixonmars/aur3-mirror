# $Id: PKGBUILD 108497 2014-03-27 14:48:25Z fyan $
# Maintainer: Felix Yan <felixonmars@gmail.com>
# Contributor: Alexander Rødseth <rodseth@gmail.com>

_pkgname=sh
pkgname=("pypy-$_pkgname" "pypy3-$_pkgname")
pkgver=1.09
pkgrel=1
pkgdesc='Subprocess interface that allows you to call any program as if it were a function'
arch=('any')
url='http://pypi.python.org/pypi/sh'
license=('MIT')
makedepends=('pypy-setuptools' 'pypy3-setuptools')
source=("http://pypi.python.org/packages/source/s/sh/$_pkgname-$pkgver.tar.gz")

build() {
  cp -r "$_pkgname-$pkgver" "pypy3-$_pkgname-$pkgver"

  cd $_pkgname-$pkgver
  pypy setup.py build

  cd ../pypy3-$_pkgname-$pkgver
  pypy3 setup.py build
}

package_pypy-sh() {
  depends=('pypy')

  cd $_pkgname-$pkgver
  pypy setup.py install -O1 --root="$pkgdir"
  install -Dm644 LICENSE.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

package_pypy3-sh() {
  depends=('pypy3')

  cd pypy3-$_pkgname-$pkgver
  pypy3 setup.py install -O1 --root="$pkgdir"
  install -Dm644 LICENSE.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

# vim:set ts=2 sw=2 et:
md5sums=('b68a2f91de880dce042d4f03ec9e0f47')
