# Contributor: Kaiting Chen <kaitocracy@gmail.com>
# Contributor: Yura Siamashka <yurand2@gmail.com>
# Contributor: Kyle Keen <keenerd@gmail.com>

pkgname='linm'
pkgver='0.8.1'
pkgrel='3'
pkgdesc='A console file manager with many features'
arch=('i686' 'x86_64')
url='http://kldp.net/projects/mls/'
license=('GPL')
depends=('ncurses' 'openssl')

md5sums=('10af8ec824b3e75d3602dad66d073655')
source=("http://kldp.net/frs/download.php/4508/${pkgname}_$pkgver-1.tar.gz")

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  sed -i 's|libsmbclient.h|samba-4.0/&|' panel/vfs/samba/SMBReader.cpp
  ./configure --prefix=/usr
  make
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make DESTDIR="$pkgdir" install
}
