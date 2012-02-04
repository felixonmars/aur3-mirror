# Maintainer: Konstantin Shabanov <kes.eclipse@gmail.com>

pkgname=eurephia
pkgver=1.0.1
pkgrel=1
pkgdesc="a flexible OpenVPN authetication plug-in"
arch=(i686 x86_64)
url="http://www.eurephia.net/"
license=('GPL')
depends=('cmake' 'sqlite3' 'openvpn-eurephia' 'libxml2' 'libxslt')
source=(http://downloads.sourceforge.net/project/eurephia/eurephia/v1.0/$pkgname-$pkgver.tar.bz2
        http://openvpn.net/release/openvpn-2.1.3.tar.gz)

md5sums=('b4c329cbac5fd38dc8f4f3f13c36bf11'
         '7486d3e270ba4b033e311d3e022a0ad7')

build() {
  cd "$srcdir/$pkgname-$pkgver"

  ./configure --prefix /usr --db-sqlite3 --plug-in --eurephiadm --openvpn-src ../openvpn-2.1.3 --fw-iptables --eurephiadm-fw || return 1
  make  || return 1
  make DESTDIR=$pkgdir install || return 1
  cp utils/eurephia_init $pkgdir/usr/bin || return 1
}

