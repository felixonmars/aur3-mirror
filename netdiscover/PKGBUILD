# Contributor: danitool
# Maintainer: Roel Blaauwgeers roel[at]ttys0.nl
pkgname=netdiscover
pkgver=0.3
pkgrel=3
pkgdesc="An active/passive address reconnaissance tool."
arch=('any')
url="http://nixgeneration.com/~jaime/netdiscover/"
license=('GPL')
depends=('libnet' 'libpcap')
makedepends=('gcc' 'make')
provides=('netdiscover')
conflicts=('netdiscover')
replaces=()
backup=()
groups=()
options=()
source=("http://nixgeneration.com/~jaime/netdiscover/releases/netdiscover-$pkgver-beta6.tar.gz"
  'misc.diff'
  'oui.diff')
md5sums=('0919227a91ecaeeb2443cff249417be2'
  '14e7a2497e4889f540f8033482437660'
  '24f8e054b579810273896f410ca2b420')

prepare() {
  cd "${srcdir}/${pkgname}-${pkgver}-beta6"
  patch -p0 -i $srcdir/oui.diff
  patch -p0 -i $srcdir/misc.diff
}

build() {
  cd "${srcdir}/${pkgname}-${pkgver}-beta6"
  ./configure --prefix=/usr --sysconfdir=/etc/
  make || return 1
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}-beta6"
  make DESTDIR="${pkgdir}" install
}
