# Contributor: osmano807 <osmano807@gmail.com>
pkgname=squidguard-beta
pkgver=1.5
pkgrel=2
pkgdesc=" An ultrafast and free filter, redirector and access controller for Squid "
url="http://www.squidguard.org/"
license=""
arch=('i686' 'x86_64')
license=('GPL-2')
depends=('db' 'squid')
makedepends=()
conflicts=(squidguard)
backup=()
install=
source=('http://www.squidguard.org/Downloads/Devel/squidGuard-1.5-beta.tar.gz')
md5sums=('a15badd7f98f726f63b418a38f117283')


build() {
	cd $srcdir/squidGuard-$pkgver-beta
	sed -i 's/DB_VERSION_MAJOR == 4/DB_VERSION_MAJOR >= 4/g' src/sgDb.c || exit 1
	sed -i '19,24 s/@[se]/$(DESTDIR)&/; /SQUIDUSER/d' Makefile.in || exit 1
	sed -i 's/define MAX_BUF 4096/define MAX_BUF 12288/g' src/sg.h.in || exit 1
	sed -i 's/strcat(buf, req->orig);/strncat(buf, req->orig, 2048);/g' src/sgDiv.c.in || exit 1
	./configure --prefix=/usr \
		--sbindir=/usr/bin \
		--localstatedir=/var \
		--sysconfdir=/etc \
		--with-sg-config=/etc/squid/squidGuard.conf \
     		--with-sg-dbhome=/var/cache/squid/squidGuard \
		--with-sg-logdir=/var/log/squid \
		--with-squiduser=proxy \
	  	--with-syslog=yes
	make || return 1
}

package() {
  cd $srcdir/squidGuard-$pkgver-beta
  make DESTDIR="$pkgdir" install
}	
