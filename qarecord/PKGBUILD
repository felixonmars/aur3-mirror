# Contributor: Shinlun Hsieh <yngwiexx@yahoo.com.tw>
# Contributor: Leslie P. Polzer <polzer@gnu.org>
pkgname=qarecord
pkgver=0.5.0
pkgrel=2
pkgdesc="A simple multithreaded stereo recording tool"
arch=(i686 x86_64)
url="http://alsamodular.sourceforge.net/"
license=('GPL')
depends=('qt' 'jack-audio-connection-kit')
source=(http://downloads.sourceforge.net/sourceforge/alsamodular/${pkgname}-${pkgver}.tar.bz2)

build() {
  cd ${startdir}/src/${pkgname}-${pkgver}
  ./configure --prefix=/usr
  make || return 1
  make prefix="$pkgdir/usr" install
}
md5sums=('4e07ec70584ee9d3cf46221afcc6f19c')
