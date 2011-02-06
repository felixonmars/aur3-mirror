# Contributor: William Heinbockel <wheinbockel@gmail.com>
pkgname=pylize
pkgver=1.3b
pkgrel=1
pkgdesc="Convert HTML into on-screen presentations"
arch=('i686' 'x86_64')
url="http://www.chrisarndt.de/en/software/pylize/toc.html"
license="GPL"
depends=('python>=2.0' 'python-empy' 'pil')
makedepends=()
source=("http://www.chrisarndt.de/en/software/$pkgname/download/$pkgname-$pkgver.tar.bz2")

build() {
  cd $startdir/src/$pkgname-$pkgver
  python ./install.py $startdir/pkg/usr
}

md5sums=('ab88ef521602c826390fe919b6bc572e')
