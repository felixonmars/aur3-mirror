# Maintainer: Jesse Jaara <gmail.com: jesse.jaara>

pkgname=varconf
pkgver=1.0.1
pkgrel=1
pkgdesc="WorldForge library to save configuration"
arch=(i686 x86_64)
url="http://worldforge.org/dev/eng/libraries/varconf"
license=('LGPL')
depends=(libsigc++2.0)
options=(!libtool)
source=("http://downloads.sourceforge.net/worldforge/varconf-$pkgver.tar.bz2")

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  ./configure --prefix=/usr --sysconfdir=/etc

  make
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  make DESTDIR="${pkgdir}" install
}

md5sums=('cb2af6ddaabccab60dd23c5e6706e8d9')
