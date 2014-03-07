# Maintainer: James Bulmer <nekinie@gmail.com>

pkgname=paste
pkgver=1.7.5.1
pkgrel=1
pkgdesc='Tools for using a Web Server Gateway Interface stack'
arch=('i686' 'x86_64')
url='http://pypi.python.org/pypi/Paste'
license=('MIT')
depends=('python2')
source=('https://pypi.python.org/packages/source/P/Paste/Paste-1.7.5.1.tar.gz')
md5sums=('7ea5fabed7dca48eb46dc613c4b6c4ed')

build() {
  cd ${srcdir}/Paste-1.7.5.1/
  python2 setup.py install --root=${pkgdir} || return 1
}