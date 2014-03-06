# Contributer: markuman <markuman@gmail.com>
# contribute to this PKGBUILD https://github.com/markuman/aur/

pkgname=recoverjpeg
pkgver=2.3
pkgrel=1
pkgdesc="Recover jpegs from damaged devices"
url="http://www.rfc1149.net/devel/recoverjpeg"
arch=('i686' 'x86_64')
license=('GPL')
depends=('glibc')
optdepends=('libexif: needed for sort-pictures'
'imagemagick: needed for sort-pictures')
source=(http://www.rfc1149.net/download/recoverjpeg/$pkgname-$pkgver.tar.gz)
md5sums=(54a36482a6bb4ec1214995fc06be27bb)
 
build() {
cd $srcdir/$pkgname-$pkgver
./configure --prefix=/usr --mandir=/usr/share/man
make || return 1
}

package() {
cd $srcdir/$pkgname-$pkgver
make DESTDIR=$pkgdir install
}
