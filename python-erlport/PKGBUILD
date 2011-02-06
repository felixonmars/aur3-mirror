# -*- shell-script -*-
#
# $Id$
#
# Contributor: Vsevolod Balashov <vsevolod@balashov.name>

name=erlport
pkgname=python-$name
pkgver=0.6
pkgrel=1
pkgdesc="Erlang port protocol for Python"
arch=('any')
url="http://pypi.python.org/pypi/$name"
license=('BSD')
depends=('python')
optdepends=('erlang')
makedepends=('setuptools')
source=(http://pypi.python.org/packages/source/e/$name/$name-$pkgver.tar.gz)
md5sums=('852745e9f2ca90f7c802ee7ae9b015ad')

build() {
  cd "$srcdir/$name-$pkgver"
  python setup.py install --prefix=/usr --root=$startdir/pkg || return 1
}
