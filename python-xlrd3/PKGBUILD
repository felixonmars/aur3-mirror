# Contributor: zhangjoto <zhangjoto@gmail.com>

pkgname=python-xlrd3
pkgver=0.1.4
pkgrel=1
pkgdesc="A library for developers to use to extract data from Microsoft Excel (tm) spreadsheet files in python 3.x."
url="https://bitbucket.org/mozman/xlrd3/overview"
depends=('python')
source=(http://pypi.python.org/packages/source/x/xlrd3/xlrd3-$pkgver.tar.gz)
arch=('any')
license=('BSD')
md5sums=('029e76b0589bbd48ad054ce95dd9cb59')

build() {
  cd $startdir/src/xlrd3-$pkgver
  python setup.py install --root=$pkgdir
}

