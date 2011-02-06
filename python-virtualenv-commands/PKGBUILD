# Maintainer: Ismael Carnales <icarnales at gmail dot com>
pkgname=python-virtualenv-commands
pkgver=0.2.3
pkgrel=2
pkgdesc="Additional commands for virtualenv"
arch=('i686' 'x86_64')
url="http://thisismedium.com/labs/virtualenv-commands/"
license=('BSD')
depends=('python2' 'setuptools', 'rsync')
source=(http://pypi.python.org/packages/source/v/virtualenv-commands/virtualenv-commands-$pkgver.tar.gz)
md5sums=('4ee0d64d5e8992a9cac1abf3657abb49')

build() {
  cd $srcdir/virtualenv-commands-$pkgver
  python2 setup.py install --prefix=/usr --root=$pkgdir/ || return 1
}
