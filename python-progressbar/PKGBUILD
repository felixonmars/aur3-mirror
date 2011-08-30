# Maintainer: Joao Cordeiro <jlcordeiro at gmail dot com>
# Contributor: Vasily Shevkunov <vasily@shevkunov.name>

pkgname=python-progressbar
pkgver=2.3
pkgrel=1
pkgdesc="Text progressbar library for python"
arch=('i686' 'x86_64')
url="http://code.google.com/p/python-progressbar/"
license=('LGPL')
depends=('python' 'python-setuptools_git')
source=(http://python-progressbar.googlecode.com/files/progressbar-$pkgver.tar.gz)
md5sums=('4f904e94b783b4c6e71aa74fd2432c59')
build() {
  cd $startdir/src/progressbar-$pkgver
  python setup.py install --root=$startdir/pkg || return 1
}
