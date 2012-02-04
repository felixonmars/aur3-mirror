# Contributor: themylogin <vovaslabs@list.ru>
pkgname=pylast-0.3.4
pkgver=0.3.4
pkgrel=1
pkgdesc="A Python interface to the Last.fm API"
arch=('i686' 'x86_64')
url="http://pylast.googlecode.com"
license=('GPL')
makedepends=('python')
depends=('python')
source=(http://pylast.googlecode.com/files/pylast-$pkgver.tar.gz)
md5sums=('4acb54115b1764286d5fa401ec3f79b7')
build() {
  cd $startdir/src/pylast-$pkgver
  python setup.py install --root=$startdir/pkg || return 1
}
