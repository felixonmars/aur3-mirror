# Maintainer: crabmane 0crabman@googlemail.com

pkgname=m4baker
pkgver=0.1.91
pkgrel=3
pkgdesc="Bake full-featured m4b-audiobooks"
arch=('any')
url='http://code.google.com/p/m4baker/'
license=('GPL')
depends=('python2' 'sox' 'faac' 'libmp4v2' 'python2-qt')
makedepends=()
optdepends=()
source=(http://m4baker.googlecode.com/files/m4baker-$pkgver.tar.gz)
provides=()
conflicts=()
replaces=()
backup=()
options=(!emptydirs)
md5sums=('a2309bf2be9352c2df7acdefbfd1fcbd')


install=

build() {
  echo "$srcdir/$pkgname-$pkgver"
  echo "$pkgdir/"
  cd $srcdir/$pkgname-$pkgver
  python2 setup.py install --root=$pkgdir/ --optimize=1 || return 1
}

