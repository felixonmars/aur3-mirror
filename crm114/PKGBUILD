# Maintainer: Tino Reichardt <milky-archlinux@mcmilk.de>
pkgname=crm114
pkgver=20100106
pkgrel=1
pkgnote="BlameMichelson"
pkgdesc="CRM114 - the Controllable Regex Mutilator"
license="GPL"
depends=()
makedepends=('tre')
conflicts=()
replaces=()
backup=()
install=
url="http://crm114.sourceforge.net/"
source=(http://crm114.sourceforge.net/tarballs/$pkgname-$pkgver-$pkgnote.src.tar.gz \
http://ftp.de.debian.org/debian/pool/main/c/$pkgname/${pkgname}_20090807-6.debian.tar.gz)
arch=('i686' 'x86_64')

build() {
	rm -rf $startdir/pkg
	cd $startdir/src/$pkgname-$pkgver-$pkgnote.src
	CFLAGS='-Os -Wall' make prefix=/usr  || return 1
	mkdir -p $pkgdir/usr/bin $pkgdir/usr/share/man/man1
	make prefix=$pkgdir/usr install
	for i in crm cssdiff cssutil; do
	    cp $srcdir/debian/$i.1 $pkgdir/usr/share/man/man1
	done
}
md5sums=('213c0b24a28a6cc0b59abc37e2b88a4b'
         'd0d588610aedbba787d9a2bb033890f1')
