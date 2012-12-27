# Maintainer: Ttech <ttech@mostlynothing.info>

pkgname=ndpmon
pkgver=2.1.0
pkgrel=1
pkgdesc="A diagnostic software application used by Internet Protocol version 6 network administrators for monitoring ICMPv6 packets"
arch=('i686' 'x86_64')
url="http://ndpmon.sourceforge.net/"
license=('GPL')
depends=('openssl' 'libpcap' 'libtool' 'autoconf' 'automake' 'libxml2' 'heirloom-mailx' 'libxslt' 'wireshark')
changelog=$pkgname.changelog
source=("http://downloads.sourceforge.net/project/$pkgname/$pkgname/$pkgname-2.1/${pkgname}_${pkgver}.tar.gz" $pkgname.service)
#optdepends=('wireshark: support for mac parsing')

sha256sums=('f5c3ce4c93a36e807ce3cfa61f7ddb1e955669a16441a673bf4f576a3069b223'
            'da47972ca74b9bfed2f70e571cbec64e83a7f19fe72b43cec8b95c41db88a392')
build() {
  cd ${srcdir}/${pkgname}_$pkgver
  autoreconf -vi
  ./configure --prefix=/usr --enable-mac-resolv --enable-countermeasures

  make
}

package() {
  cd ${srcdir}/${pkgname}_$pkgver
  sed -ie "s/etc\/init.d/etc\/rc.d/g" ${srcdir}/${pkgname}_$pkgver/Makefile
  make DESTDIR=${pkgdir} install

  install -D -m644 ${srcdir}/$pkgname.service ${pkgdir}/usr/lib/systemd/system/$pkgname.service
}
