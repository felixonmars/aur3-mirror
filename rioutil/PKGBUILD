# Contributor: Arnau Sanchez <tokland {at} gmail {dot} com>
pkgname=rioutil
pkgver=1.5.0
pkgrel=1
pkgdesc="Interface with mp3 players Rio 600/800/900/Riot/S-Series and Nike psa[play"
arch=(i686 x86_64)
url="http://rioutil.sourceforge.net/"
license=('LGPL')
depends=('libusb')
makedepends=('libusb')
source=("http://downloads.sourceforge.net/${pkgname}/${pkgname}-${pkgver}.tar.gz")
md5sums=('0663d52c97fb20dfc93185ac805e5048')
 
build() {
  cd $srcdir/$pkgname-$pkgver
  ./configure --prefix=/usr || return 1
  make || return 1
  make install DESTDIR=${pkgdir} 
}
