# Contributor: Jon Bergli Heier <snakebite@jvnv.net>
pkgname=multihash
pkgver=0.1.1
pkgrel=1
pkgdesc="Multihash is a library for hashing with multiple algorithms at the same time."
arch=(i686 x86_64)
url="http://redmine.jvnv.net/projects/multihash"
license=('GPL')
depends=('python' 'boost')
source=(http://archive.jvnv.net/$pkgname-$pkgver.tar.gz)
md5sums=('f444785dd591d5bb364ba58d554ba3c6')

build() {
  cd "$srcdir/$pkgname-$pkgver"

  python setup.py install --root=${pkgdir} || return 1
}

# vim:set ts=2 sw=2 et:
