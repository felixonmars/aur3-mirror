# Contributor: Brad Arrington

pkgname=samhain
pkgver=3.0.2
pkgrel=1
pkgdesc="file integrity / intrusion detection system"
arch=(i686 x86_64)
url="http://www.la-samhna.de/"
license=('GPL')
depends=('gcc')
source=(http://www.la-samhna.de/samhain/${pkgname}-current.tar.gz)

md5sums=('bd2a3a5550c5d8967a24ae273deea578')

build() {
  tar -zxvf "${srcdir}/${pkgname}-current.tar.gz" -C "${srcdir}"/.
  cd "${srcdir}"
  tar -zxvf ${pkgname}-${pkgver}.tar.gz
  cd "${pkgname}-${pkgver}"
  ./configure --prefix=/usr --localstatedir=/var --sysconfdir=/etc --with-trusted=0 
# --enable-network=server
  make || return 1
  make DESTDIR="$pkgdir/" install
}
