# Author: Nathan Owe. <ndowens.aur @ gmail.com>
pkgname=fakebo
pkgver=0.4.1
pkgrel=2
pkgdesc="This program fakes trojan servers and logs every attempt from client. It is possible to log attempts to file, stdout, stderr or to syslog. It can send fake pings and replies back to trojan client."
arch=('i686' 'x86_64')
url="http://cvs.linux.hr/fakebo"
license="GPL"
depends=('glibc')
backup=('etc/fakebo.conf')
source=(ftp://ftp.linux.hr/pub/fakebo/${pkgname}-${pkgver}.tar.gz)
md5sums=('442b48ba44250104c30a6e7975230b7c')

build() {
        cd ${srcdir}/${pkgname}-${pkgver}
        ./configure --prefix=/usr --mandir=/usr/share/man --sysconfdir=/etc
		make
	}
package() {
		cd ${srcdir}/${pkgname}-${pkgver}
        make install DESTDIR=${pkgdir} 
}
