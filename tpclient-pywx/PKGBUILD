# Contributor: jmtan <jmingtan@gmail.com>
pkgname=tpclient-pywx
pkgver=0.3.1.1
pkgrel=1
pkgdesc="The wxwidgets client for Thousand Parsec, a 4x strategy game framework."
arch=('i686')
url="http://www.thousandparsec.net/"
license=('GPL')
depends=('wxpython' 'python-numpy' 'wxgtk')
makedepends=()
provides=()
conflicts=()
replaces=()
backup=()
groups=()
options=()
install=
source=(http://www.thousandparsec.net/tp/downloads/tpclient-pywx/$pkgname-$pkgver-inplace.tar.bz2)
noextract=()
md5sums=('658e013bf3a1b688465c41bed4cf6e2b')
build() {
  cd $startdir/src
  mkdir ../pkg/opt
  cp -R $pkgname-$pkgver-inplace ../pkg/opt
}

