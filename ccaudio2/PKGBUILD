pkgname=ccaudio2
pkgver=2.1.1
pkgrel=1
pkgdesc="The GNU ccAudio2 library and utilities"
arch=('i686' 'x86_64')
url="http://www.gnu.org/software/ccaudio/"
license=('GPL' 'custom')
depends=('ucommon' 'gsm' 'speex')
options=('!libtool')
source=("ftp://ftp.gnu.org/pub/gnu/ccaudio/$pkgname-$pkgver.tar.gz"{,.sig})
md5sums=('4d5c18359e27ec57433975a48c65df49'
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
