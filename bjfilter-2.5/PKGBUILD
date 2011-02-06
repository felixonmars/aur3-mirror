#Contributor: Charles Lindsay <charles@chaoslizard.org>
pkgname=bjfilter-2.5
pkgver=2.5
pkgrel=1
pkgdesc="Filter program to use canon pixus ip3100/ip4100/ip8600 and pixma ip1000/ip1500"
arch=('i686')
url="http://mambo.kuhp.kyoto-u.ac.jp/~takushi/"
license=('GPL')
depends=('libpng' 'libtiff' 'libcnbj-2.5' 'pstocanonbj')
source=(http://mambo.kuhp.kyoto-u.ac.jp/~takushi/debian/$pkgname\_1.orig.tar.gz)
md5sums=('19dcae704a48c518ee7db00124c79f68')

build() {
  cd $startdir/src/$pkgname-1
  patch -Np0 -i ../../patch.diff || return 1
  ./configure --prefix=/usr
  make || return 1
  make DESTDIR=$startdir/pkg install
}
