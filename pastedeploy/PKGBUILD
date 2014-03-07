# Maintainer: James Bulmer <nekinie@gmail.com>

pkgname=pastedeploy
pkgver=1.5.2
pkgrel=1
pkgdesc='A pluggable command-line frontend, including commands to setup package file layouts'
arch=('i686' 'x86_64')
url='http://pypi.python.org/pypi/PasteDeploy'
license=('MIT')
depends=('python2' 'paste')
source=('https://pypi.python.org/packages/source/P/PasteDeploy/PasteDeploy-1.5.2.tar.gz')
md5sums=('352b7205c78c8de4987578d19431af3b')

build() {
  cd ${srcdir}/PasteDeploy-1.5.2/
  python2 setup.py install --root=${pkgdir} || return 1
}