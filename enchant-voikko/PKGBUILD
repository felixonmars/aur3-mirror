
# Contributor: Jussi Timperi <jussi.timperi at gmail dot com> 

pkgname=enchant-voikko
pkgver=1.6.0
pkgrel=1
pkgdesc="A enchant provider plugin that allows using Voikko in any application that uses enchant"
arch=('i686' 'x86_64')
license=('LGPL')
depends=('enchant' 'libvoikko')
source=(http://www.abisource.com/downloads/enchant/${pkgver}/enchant-${pkgver}.tar.gz)
url="http://www.abisource.com/enchant/"

build() {
  cd "${srcdir}/enchant-${pkgver}"
  
./configure --prefix=/usr --disable-static --disable-ispell --disable-myspell --disable-aspell \
  --disable-uspell --disable-hspell --disable-zemberek
  make
}

package() {
  cd "${srcdir}/enchant-${pkgver}"

  mkdir -p "$pkgdir/usr/lib/enchant"
  cp src/voikko/.libs/libenchant_voikko.so "$pkgdir/usr/lib/enchant"
}
md5sums=('de11011aff801dc61042828041fb59c7')
