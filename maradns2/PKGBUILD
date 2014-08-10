pkgname=maradns2
pkgver=2.0.09
pkgrel=1
pkgdesc="A security-aware DNS server"
arch=('i686' 'x86_64')
url="http://maradns.org/"
depends=()
conflicts=('deadwood')
replaces=('maradns')
license=('custom')
source=(http://maradns.org/download/2.0/$pkgver/maradns-$pkgver.tar.gz
	maradns.service
	zoneserver.service
	Deadwood.service
	locations.patch)
md5sums=('13f449a9079b618179ff0d44fb892787'
         '6339458fce452e6973fe897ec0520d28'
         'dd039497df1f4ead054fd3a835885dff'
         'b708f867586d2105cf49238a5a545b0d'
         '257f42797dee2175dc50f79cca673a4c')

build() {
  cd ${srcdir}/maradns-${pkgver}
  ./configure --ipv6
  make
}

package() {
  cd ${srcdir}/maradns-${pkgver}
  patch -p0 < ${startdir}/locations.patch
  install -dm0755 ${pkgdir}/{etc,usr/{bin,sbin,share/man/man{1,5,8}}}
  install -d ${pkgdir}/usr/share/doc/
  install -d ${pkgdir}/usr/lib/systemd/system
  make install PREFIX=${pkgdir}/usr RPM_BUILD_ROOT=${pkgdir}
  install -m755 ${startdir}/maradns.service ${pkgdir}/usr/lib/systemd/system
  install -m755 ${startdir}/zoneserver.service ${pkgdir}/usr/lib/systemd/system
  install -m755 ${startdir}/Deadwood.service ${pkgdir}/usr/lib/systemd/system
  install -Dm644 COPYING ${pkgdir}/usr/share/licenses/maradns2/COPYING
  
}
