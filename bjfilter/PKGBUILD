#Contributor: Sascha Hoppe <mail@saschahoppe.de>
pkgname=bjfilter
pkgver=2.2
pkgrel=1
pkgdesc="Filter program to use Canon Pixus 550i/850i/950i"
arch=('i686')
url="http://mambo.kuhp.kyoto-u.ac.jp/~takushi/"
license=('GPL')
depends=('libpng' 'libtiff' 'libcnbj' 'pstocanonbj')
source=(http://mambo.kuhp.kyoto-u.ac.jp/~takushi/debian/$pkgname-$pkgver\_1-1.tar.gz patch.diff)
noextract=()
md5sums=('19ee32cb1d9ca2e774a4a2a01f25bbb7' 'de73a7199769f9f3057fed42ce6088a8')

build() {
  cd $startdir/src/$pkgname-$pkgver-1/src
  patch -Np0 -i ../../patch.diff
  cd $startdir/src/$pkgname-$pkgver-1/
  ./configure --prefix=/usr
  make || return 1
  make DESTDIR=$startdir/pkg install
}
