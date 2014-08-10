# Maintainer: Julian Sparber julian@sparber.net
_pkgsourcename=cardos
_pkgresourcename=cardos
pkgname=cardos
pkgver=1.0
pkgrel=1
pkgdesc="CardOS Software for rete Civica of provinca di Bolzano. You have to start pcscd as root"
url="http://www.provinz.bz.it/buergerkarte"
license=('custom')
arch=('i686', 'x86_64')
if test "$CARCH" == x86_64; then
	source=(http://www.provinz.bz.it/buergerkarte/downloads/linux/cardos64.tar.gz)
md5sums=('e7766351944a6716fe842e7242d985b5')
else
source=(http://www.provinz.bz.it/buergerkarte/downloads/linux/cardos.tar.gz)
md5sums=('14722e5398ea490179a92dd7f490c404')
fi
depends=('pcsc-tools' 'pcsclite' 'ccid' 'libxmu')
provides=('cardos')

build() {
	mkdir etc/ld.so.conf.d || return 0
  echo "/usr/local/lib" > etc/ld.so.conf.d/cardos.conf
  rm  usr/local/lib/libgmp.so.3
  rm  usr/local/lib/libces.so.1
}
package() {
  install -m 755 -D etc/ld.so.conf.d/cardos.conf ${pkgdir}/etc/ld.so.conf.d/cardos.conf
  install -m 755 -D etc/sieca.conf ${pkgdir}/etc/sieca.conf
  install -m 755 -D usr/local/bin/siecapin ${pkgdir}/usr/local/bin/siecapin
  install -m 755 -d usr/local/lib/ ${pkgdir}/usr/local/lib
  install -m 755 -D usr/local/lib/* ${pkgdir}/usr/local/lib
}
post_install() {
  ldconfig -n /usr/local/lib/
}
