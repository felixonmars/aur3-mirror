# Contributor: Thomas Haider <t.haider@vcnc.org>
pkgname=boot-digest
pkgver=0.4
pkgrel=3
pkgdesc="Allows validating integrity of bootpartition upon startup/resume"
arch=('i686')
url="http://alon.barlev.googlepages.com/utilities"
license=('custom:BSD')
depends=('perl-digest-sha' 'hibernate-script')
makedepends=('sed')
install=$pkgname.install
source=(http://alon.barlev.googlepages.com/$pkgname-$pkgver.tar.bz2 \
	boot-digest.rcd \
	bootdigest.scriptlet \
	boot-digest.install)
md5sums=('c59ea10fec9e26ea607ff17ce5982f36'
         '247d28f29954c0b80d638c16a2c3a8a1'
	 '81f3f0e2eb40552db5477e59a6d6b70c'
	 'b3fed9decdb14d5cea5a660ffa6e6ac4')

build()
{
	cd $startdir/src/$pkgname-$pkgver
	./configure --prefix=/usr --digest=SHA-256
	
	make || return 1
	make DESTDIR=$startdir/pkg install

	install -D -m755 $startdir/src/boot-digest.rcd $startdir/pkg/etc/rc.d/boot-digest
	install -D -m644 $startdir/src/bootdigest.scriptlet $startdir/pkg/usr/share/hibernate/scriptlets.d/bootdigest
	install -D -m644 LICENSE $startdir/pkg/usr/share/licenses/$pkgname/LICENSE
}
