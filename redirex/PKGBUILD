# Maintainer: Christian Hesse <mail@eworm.de>

pkgname=redirex
pkgver=2.0
pkgrel=1
pkgdesc="Redirect HTTP Requests to New Web Server"
arch=('any')
url="http://www.fourmilab.ch/webtools/redirex/"
license=('GPL')
makedepends=('perl')
source=('http://www.fourmilab.ch/webtools/redirex/redirex.tar.gz'
	'redirex.service')
backup=('etc/redirex.conf')

build() {
	sed -i -e 's/\r//' -e '1c#!/usr/bin/perl -w' redirex
}

package() {
	install -D -m755 ${srcdir}/redirex ${pkgdir}/usr/sbin/redirex
	install -D -m644 ${srcdir}/redirex.conf ${pkgdir}/etc/redirex.conf
	install -D -m644 ${srcdir}/redirex.service ${pkgdir}/usr/lib/systemd/system/redirex.service
}

sha256sums=('2f761d1c7c31cd768463204573b4e900c4429b2cdd27e916d00f6d85a132c7d8'
            'b2fc113865a40579cb92e1d6c9482b9e6c14e633e6ffe6933b850f6be780eb8a')
