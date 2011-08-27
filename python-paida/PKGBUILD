# Maintainer: Sebastien Binet <binet@cern.ch>

pkgname=python-paida
pkgver=3.2.1_2.10
pkgrel=1
pkgdesc="PAIDA is pure Python scientific analysis package and supports AIDA (Abstract Interfaces for Data Analysis)."
url="http://paida.sourceforge.net/"
license="Python Software Foundation License"
depends=( "python>=2.3" "zlib" )
arch=('i686' 'x86_64')
makedepends=()
conflicts=()
replaces=()
backup=()
install=
source=(http://ufpr.dl.sourceforge.net/sourceforge/${pkgname/python-/}/${pkgname/python-/}-$pkgver.tar.gz)
md5sums=('700c45602b986aaa57f95fe890315d97')

build() {
  cd $startdir/src/${pkgname/python-/}-$pkgver
	python setup.py install --root=$startdir/pkg
}