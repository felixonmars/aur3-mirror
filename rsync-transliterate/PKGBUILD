# $Id: PKGBUILD 216422 2014-07-03 18:35:18Z pierre $

_pkgname=rsync
pkgname=${_pkgname}-transliterate
pkgver=3.1.1
pkgrel=2
pkgdesc="A file transfer program to keep remote files in sync"
arch=('i686' 'x86_64')
url="http://rsync.samba.org/"
license=('GPL3')
depends=('perl' 'popt' 'acl' 'zlib')
provides=("rsync=$pkgver")
conflicts=('rsync')
backup=('etc/rsyncd.conf' 'etc/xinetd.d/rsync')
source=("http://rsync.samba.org/ftp/rsync/$_pkgname-$pkgver.tar.gz"
        "http://rsync.samba.org/ftp/rsync/$_pkgname-$pkgver.tar.gz.asc"
        'rsyncd.conf' 'rsync.xinetd' 'rsyncd.service'
        'rsyncd.socket' 'rsyncd@.service'
        'transliterate.diff')
md5sums=('43bd6676f0b404326eee2d63be3cdcfe'
         'SKIP'
         'bce64d122a8e0f86872a4a21a03bc7f3'
         'ea3e9277dc908bc51f9eddc0f6b935c1'
         'f90ba7f3717028769d6f230a2402b5aa'
         'ae4c381e0c02d6132c7f6ded3f473041'
         '53f94e613e0bc502d38dd61bd2cd7636'
         '55b7fb484250c128bde6aa86389384d4')

build() {
	cd "$srcdir/$_pkgname-$pkgver"

	patch -p1 < "$srcdir/transliterate.diff"

	./configure --prefix=/usr \
		--with-included-popt=no \
		--disable-debug
	make
}

check() {
	cd "$srcdir/$_pkgname-$pkgver"
	make test
}

package() {
	cd "$srcdir/$_pkgname-$pkgver"
	make DESTDIR="$pkgdir" install
	install -Dm644 ../rsyncd.conf "$pkgdir/etc/rsyncd.conf"
	install -Dm644 ../rsync.xinetd "$pkgdir/etc/xinetd.d/rsync"
	install -Dm644 ../rsyncd.service "$pkgdir/usr/lib/systemd/system/rsyncd.service"
	install -m644 ../rsyncd.socket "$pkgdir/usr/lib/systemd/system/rsyncd.socket"
	install -m644 ../rsyncd@.service "$pkgdir/usr/lib/systemd/system/rsyncd@.service"
	install -Dm755 support/rrsync "$pkgdir/usr/lib/rsync/rrsync"
}
