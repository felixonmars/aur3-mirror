pkgname=ccscript
pkgver=5.0.0
pkgrel=1
pkgdesc="The GNU ccScript C++ scripting engine"
arch=('i686' 'x86_64')
url="http://www.gnu.org/software/ccscript/"
license=('GPL' 'custom')
depends=('ucommon')
options=('!libtool')
source=("ftp://ftp.gnu.org/pub/gnu/ccscript/$pkgname-$pkgver.tar.gz"{,.sig})
md5sums=('ffb64d58ff611b8395d197ada8cfe3c2'
         'SKIP')

build() {
  cd ${pkgname}-${pkgver}
  ./configure --prefix=/usr
  make
}

package() {
  cd ${pkgname}-${pkgver}
  make DESTDIR="${pkgdir}" install
}
