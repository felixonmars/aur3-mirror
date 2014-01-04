# Contributor: osmano807 <osmano807@gmail.com>
pkgname=squidguard
pkgver=1.4
pkgrel=13
pkgdesc=" An ultrafast and free filter, redirector and access controller for Squid "
url="http://www.squidguard.org/"
license=""
arch=('i686' 'x86_64')
license=('GPL')
depends=('db' 'squid')
makedepends=()
conflicts=(squidguard-1.4)
replaces=(squidguard-1.4)
backup=()
install=
source=(http://squidguard.org/Downloads/squidGuard-1.4.tar.gz
        squidGuard-${pkgver}_upgrade.patch)
md5sums=('de834150998c1386c30feae196f16b06'
         '6921d90a21031d68a3b6739169d2bddb')


build() {
	cd $srcdir/squidGuard-$pkgver
	sed -i 's/DB_VERSION_MAJOR == 4/DB_VERSION_MAJOR >= 4/g' src/sgDb.c
	sed -i '19,24 s/@[se]/$(DESTDIR)&/; /SQUIDUSER/d' Makefile.in
    patch -Np1 < $srcdir/squidGuard-${pkgver}_upgrade.patch
	./configure --prefix=/usr \
		--with-sg-config=/etc/squid/squidGuard.conf \
     		--with-sg-dbhome=/var/cache/squid/squidGuard \
		--with-sg-logdir=/var/log/squid \
		--with-squiduser=proxy
	make || return 1
}

package() {
  cd $srcdir/squidGuard-$pkgver
  make DESTDIR="$pkgdir" install
  #pwd
  #echo $pkgdir
}	
