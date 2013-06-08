# Maintainer: Tom Guillen <freetoken at zoho dot com>
pkgname=nsis-wine
pkgver=2.46
pkgrel=1
pkgdesc='A professional open source system to create Windows installers'
arch=('i686' 'x86_64')
url='http://nsis.sourceforge.net'
license=('custom:zlib')
depends=('wine')
makedepends=('unzip')
provides=('nsis')
conflicts=('nsis')
options=(!strip)
_realname=nsis
source=(nsis makensis makensisw http://downloads.sourceforge.net/project/nsis/NSIS%202/$pkgver/$_realname-$pkgver.zip)
md5sums=('b0384ff854bc52248d3049502c531329'
         'aa90ef0d7d6384327d288cbae70dd0c8'
         '937989721199351ed0e01158baaf080c'
         'd7e43beabc017a7d892a3d6663e988d4')
build(){
  rm -rf ${srcdir}/$_realname-build/
  mkdir ${srcdir}/$_realname-build/
  cp -ra ${srcdir}/$_realname-$pkgver/* ${srcdir}/$_realname-build/
}
package() {
  install -d -m755 ${pkgdir}/usr/share/nsis
  cp -ra ${srcdir}/$_realname-build/* ${pkgdir}/usr/share/nsis/
  install -Dm644 ${srcdir}/$_realname-$pkgver/COPYING "$pkgdir/usr/share/licenses/$_realname/LICENSE"
  find ${pkgdir}/usr/share/nsis -type d -exec chmod 755 "{}" \;
  find ${pkgdir}/usr/share/nsis -type f -exec chmod 644 "{}" \;

  install -d -m755 ${pkgdir}/usr/bin
  install -m755 nsis ${pkgdir}/usr/bin
  install -m755 makensis ${pkgdir}/usr/bin
  install -m755 makensisw ${pkgdir}/usr/bin

}
