# Contributor: d'Ronin <daronin@2600.com>

pkgname='libbotan'
pkgver='1.8.9'
pkgrel='1'
pkgdesc='BSD-licensed crypto library written in C++.'
license=('BSD')
arch=('i686' 'x86_64')
url='http://botan.randombit.net'
depends=('perl')
install=
source=(http://files.randombit.net/botan/Botan-$pkgver.tgz)
md5sums=('08eb250d8a06d6e11220396ee27aec85')

build() {
  cd $startdir/src/Botan-$pkgver
  ./configure.py --prefix=/usr
  make || return 1
  make DESTDIR=$startdir/pkg/usr install
}
