# Maintainer: Vlatko Kosturjak <kost@linux.hr>
# Based on suricata by Jaroslav Lichtblau <dragonlord@aur.archlinux.org>

pkgname=suricata-dev
_pkgname=suricata
pkgver=2.1beta3
pkgrel=1
pkgdesc="An Open Source Next Generation Intrusion Detection and Prevention Engine - Development version"
arch=('i686' 'x86_64')
url="http://openinfosecfoundation.org/index.php/download-suricata"
license=('GPL2')
depends=('libcap-ng' 'libnet' 'libpcap' 'libyaml' 'pcre' )
conflicts=('libhtp' 'suricata')
provides=('libhtp' 'suricata')
optdepends=('snort: suricata can use rulesets provided by snort')
source=(http://openinfosecfoundation.org/download/$_pkgname-$pkgver.tar.gz)

build() {
  cd ${srcdir}/$_pkgname-$pkgver

  ./configure --prefix=/usr
  make
}

package() {
  cd ${srcdir}/$_pkgname-$pkgver

  make DESTDIR=${pkgdir} install

  install -d ${pkgdir}/var/log/$_pkgname
  install -D -m644 $_pkgname.yaml ${pkgdir}/usr/share/$_pkgname/$_pkgname.yaml
}
sha256sums=('3e6fe2f099697e893db3074406acefb8c567386f3423977ace9aac518a63cb74')
