pkgname=herqq-svn-r55
pkgver=1
pkgrel=1
pkgdesc="Herqq project (HUpnp library), SVN Revision 55"
arch=('i686' 'x86_64')
url="http://www.herqq.org"
license=('GPL3')
makedepends=('automoc4' 'cmake')

build() {

	msg "Downloading SVN Revision 55"

	svn co -r 55  https://hupnp.svn.sourceforge.net/svnroot/hupnp hupnp
	cd "$srcdir/hupnp/trunk/herqq"

	msg "Compile"

	qmake -recursive
	make || return 1

}

package() {
	
	cd "$srcdir/hupnp/trunk/herqq"
	make install
	
	msg "Copying files"
	
	mkdir -p "$pkgdir/usr/lib"

	install -m 644 "$srcdir/hupnp/trunk/herqq/hupnp/bin/libHUpnp.so.1.0.0" "$pkgdir/usr/lib/libHUpnp.so"
	ln -s "$pkgdir/usr/lib/libHUpnp.so" "$pkgdir/usr/lib/libHUpnp.so.1"
	
	install -m 644 "$srcdir/hupnp/trunk/herqq/hupnp/bin/libQtSolutions_SOAP-2.7.so.1.0.0" "$pkgdir/usr/lib/libQtSolutions_SOAP-2.7.so"
	ln -s "$pkgdir/usr/lib/libQtSolutions_SOAP-2.7.so" "$pkgdir/usr/lib/libQtSolutions_SOAP-2.7.so.1"

	mkdir -p "$pkgdir/usr/include"
	cp -r "$srcdir/hupnp/trunk/herqq/hupnp/deploy/include/HUpnpCore" "$pkgdir/usr/include"
	rm -r "$srcdir/hupnp/trunk/herqq/hupnp/include/HUpnpCore/public"
	rm -r "$srcdir/hupnp/trunk/herqq/hupnp/include/HUpnpCore/private"
	cp $srcdir/hupnp/trunk/herqq/hupnp/include/HUpnpCore/* "$pkgdir/usr/include/HUpnpCore"
	chmod -R 644 "$pkgdir/usr/include/HUpnpCore"
	chmod 755 "$pkgdir/usr/include/HUpnpCore"
	chmod 755 "$pkgdir/usr/include/HUpnpCore/public"
	chmod 755 "$pkgdir/usr/include/HUpnpCore/private"

}
