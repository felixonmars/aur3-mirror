# Maintainer: Nishit Joseph reachjlight at gmail dot com

pkgbase=python-openpyxl
pkgname=python-openpyxl-hjunes
provides=('python-openpyxl')
conflicts=('python2-openpyxl')
pkgver=1.5.7
pkgrel=1
pkgdesc="A Python library to read/write Excel 2007 xlsx/xlsm files. This is hjunes version for python 3"
arch=('any')
license=('MIT')
url="https://bitbucket.org/hjunes/openpyxl"
depends=('python' 'python-distribute')
conflicts=()
replaces=()
source=(https://bitbucket.org/hjunes/openpyxl/get/$pkgver.tar.gz)
md5sums=('e2eb431ba48e3ed9d183c82cd40c8210')


package() {
  cd $srcdir/hjunes-openpyxl-0efd715c8224

  python setup.py build 
  python setup.py install --prefix=/usr --root=$pkgdir --optimize=1 --skip-build
}
