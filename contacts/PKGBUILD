# Maintainer: Košava <kosava@archlinux.us>

pkgname=contacts
pkgver=0.12
pkgrel=4
pkgdesc="A small, lightweight addressbook that uses libebook, part of EDS"
url="http://pimlico-project.org/contacts.html"
license="GPL"
depends=('evolution-data-server')
makedepends=('intltool')
arch=('i686' 'x86_64')
source=(http://pimlico-project.org/sources/$pkgname/$pkgname-$pkgver.tar.gz contacts.install)
md5sums=('9615e17535a115dad741a9e38c34f746'
         '234354b30960f8461cc4d7193ae317a4')

install="contacts.install"
 	
build() {
	cd $srcdir/$pkgname-$pkgver
	./configure --prefix=/usr --sysconfdir=/etc --enable-gconf --enable-gnome-vfs
 	make
 	make GCONF_DISABLE_MAKEFILE_SCHEMA_INSTALL=1 DESTDIR=$startdir/pkg install 
 	install -m755 -d "$pkgdir/usr/share/gconf/schemas"
 	gconf-merge-schema "$pkgdir/usr/share/gconf/schemas/${pkgname}.schemas" $pkgdir/etc/gconf/schemas/*.schemas
}