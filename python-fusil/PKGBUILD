# $Id: pkgbuild-mode.el,v 1.23 2007/10/20 16:02:14 juergen Exp $
# Original package: Sebastien Binet <binet@lblbox>
# Maintainer: Robin Vossen <robin@codeinject.org>
pkgname=python-fusil
pkgver=1.4
pkgrel=1
pkgdesc="Fusil the fuzzer is a Python library used to write fuzzing programs. I t helps to start process with a prepared environment (limit memory, environment variables, redirect stdout, etc.), start network client or server, and create mangled files"
url="http://bitbucket.org/haypo/fusil/wiki/Home"
arch=('i686' 'x86_64')
license=('GPL2')
depends=('python' 'python-ptrace')
makedepends=()
conflicts=()
replaces=()
backup=()
install=
source=(http://pypi.python.org/packages/source/f/fusil/fusil-$pkgver.tar.gz)
md5sums=('04c3844a112f788b34bde5f2ab6ee114')

build() {
  cd $startdir/src/fusil-$pkgver
  python setup.py build || return 1
  python setup.py install --prefix=/usr --root=$startdir/pkg || return 1
}
