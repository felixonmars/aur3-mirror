# Maintainer: alister.hood <gmail>
pkgname=judge
pkgver=0.0.2
pkgrel=1
pkgdesc="Evaluate the quality of jpeg images (e.g. to guess which was saved with higher quality)."
arch=('i686' 'x86_64')
depends=('libjpeg')
url="http://oldhome.schmorp.de/marc/judge.html"
license=('GPL')
source=("http://oldhome.schmorp.de/marc/data/$pkgname-$pkgver.tar.gz")
md5sums=('d56757fc8916a03fd2ce87cb68bba937')

build() {
  cd $srcdir/$pkgname-$pkgver
  ./configure --prefix=/usr --mandir=/usr/share/man
  make
}

package() {
  cd $srcdir/$pkgname-$pkgver
  make DESTDIR=$pkgdir install
}

