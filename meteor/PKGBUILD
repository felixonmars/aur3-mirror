# Maintainer: Alvis Mikovs <alvis.mikovs@gmail.com>
# Contributor: Alvis Mikovs <alvis.mikovs@gmail.com>

pkgname=meteor
pkgver=1.06
pkgrel=1
pkgdesc="HTTP server, offering developers a simple means of integrating streaming data into web applications."
arch=('i686' 'x86_64')
license=('GPL2')
depends=(perl)
url="http://meteorserver.org/"

install=${pkgname}.install
source=(http://meteorserver.org/download/latest.tgz
        meteord
				meteord.conf)
md5sums=('002cc0a1c5765d2dec8755107cffa681'
         '9b0ceb804717a48470eafcc9be986a08'
         '6d09dff69efcff6a2831515482cbc9e8')

build() {
	install -D -m 755 $srcdir/meteord $pkgdir/usr/sbin/meteord
	install -d -m 755 $pkgdir/usr/lib/perl5/site_perl/current/Meteor/
	cp -R $srcdir/Meteor/* $pkgdir/usr/lib/perl5/site_perl/current/Meteor/
	chmod 644 $pkgdir/usr/lib/perl5/site_perl/current/Meteor/*
	install -d -m 755 $pkgdir/srv/meteor/
	cp -R $srcdir/public_html/* $pkgdir/srv/meteor/
	chmod 644 $pkgdir/srv/meteor/*
	install -D -m 644 $startdir/meteord.conf $pkgdir/etc/meteord.conf
	install -D -m 755 $startdir/meteord $pkgdir/etc/rc.d/meteord
}

