# Contributor: Roberto Alsina <ralsina@kde.org>
pkgname=pyhyphen
pkgver=0.10
pkgrel=3
pkgdesc="The hyphenation library of OpenOffice and FireFox wrapped for Python"
arch=('i686' 'x86_64')
url="http://pyhyphen.googlecode.com/"
license=('GPL')
depends=('python')
source=(http://pypi.python.org/packages/source/P/PyHyphen/PyHyphen-$pkgver.zip )

build() {
  cd $startdir/src/PyHyphen-$pkgver
  python setup.py bdist_dumb || return 1
  cd $startdir/pkg
  tar xzvf $startdir/src/PyHyphen-$pkgver/dist/PyHyphen-$pkgver.linux*.tar.gz
}
md5sums=('02916b172c178d8bb664ed6fb442fe1f')
