# Maintainer: Kirill Malyshev <keryascorpio@gmail.com>

pkgname=networkmanager-sstp-arch
pkgver=0.9.8
pkgrel=0
pkgdesc='NetworkManager VPN plugin for SSTP'
arch=('i686' 'x86_64')
url=('http://sstp-client.sourceforge.net/')
license=('GPL2')
depends=('sstp-client' 'networkmanager>=0.9.6' 'gtk3' 'libgnome-keyring')
makedepends=('intltool')
source=('http://sourceforge.net/projects/sstp-client/files/network-manager-sstp/0.9.8-1/NetworkManager-sstp-0.9.8.tar.bz2')
md5sums=('247cd4efbc6ec9179473b2bacb2717a2')         

build() {
	tar -xjf NetworkManager-sstp-0.9.8.tar.bz2
	cd  NetworkManager-sstp-0.9.8

	CFLAGS="-g -O2 -Wno-error=deprecated-declarations"

        ./configure --prefix=/usr --sysconfdir=/etc --libexecdir=/usr/lib/networkmanager --disable-static --with-pppd-plugin-dir=/usr/lib/pppd/2.4.5
        make
}

package() {
	cd  NetworkManager-sstp-0.9.8
        
        make DESTDIR=${pkgdir} install
}

