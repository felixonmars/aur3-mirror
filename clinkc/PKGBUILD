# Contributor: twa022 <twa022@gmail.com>

pkgname=clinkc
pkgver=2.3.0
pkgrel=1
url="http://clinkc.sourceforge.net/"
pkgdesc="UPnP library using C for small and embedded platforms"
arch=(i686 x86_64)
license=('custom')
depends=('curl>=7.13.0' 'libxml2>=2.6.0' 'expat>=1.9.5' 'libupnp')
makedepends=('doxygen')
source=(http://downloads.sourceforge.net/sourceforge/${pkgname}/${pkgname}230.tar.gz)
md5sums=('34c45a0bff4603ff6409cb9e93692061')

build() {
  cd ${srcdir}/${pkgname}-${pkgver%.*}
  ./configure --prefix=/usr --sysconfdir=/etc || return 1
  make || return 1
  make DESTDIR="${pkgdir}" install || return 1
  install -D -m644 COPYING ${pkgdir}/usr/share/licenses/clinkc
}
