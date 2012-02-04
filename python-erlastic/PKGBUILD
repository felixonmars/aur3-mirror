# -*- shell-script -*-
#
# $Id$
#
# Contributor: Vsevolod Balashov <vsevolod@balashov.name>

name=erlastic
pkgname=python-$name
pkgver=1.0.0
pkgrel=1
#pkgdesc="Erlastic"
pkgdesc="Erlang binary term codec and port interface. Modeled after Erlectricity."
arch=('any')
url="http://github.com/samuel/$pkgname"
#url="http://pypi.python.org/pypi/$name"
license=('BSD')
depends=('python')
optdepends=('erlang')
makedepends=('setuptools')
source=(http://pypi.python.org/packages/source/e/$name/$name-$pkgver.tar.gz)
md5sums=('cefb292742e1664d5d2bd24f4f29e92c')

build() {
  cd "$srcdir/$name-$pkgver"
  python setup.py install --prefix=/usr --root=$startdir/pkg || return 1
}
