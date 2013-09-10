# Maintainer: Daniil Bolsun <dan.bolsun@gmail.com>

pkgname=ratproxy-svn
pkgver=12
pkgrel=1
pkgdesc="A semi-automated web application security audit tool."
arch=('i386' 'x86_64')
url="https://code.google.com/p/ratproxy/"
license=('Apache')
depends=('openssl')
case "$CARCH" in
i386)
	depends+=('zlib')
	;;
x86_64)
	depends+=('lib32-zlib')
	;;
esac
makedepends=('subversion')
provides=('ratproxy')
conflicts=('ratproxy')
source=("$pkgname::svn+http://ratproxy.googlecode.com/svn/trunk/")
md5sums=(SKIP)

#pkgver() {
#	cd "$scrdir/$pkgname"
#	awk '/#define VERSION/ { gsub("\"", ""); gsub("-", "_"); print $NF }' config.h
#}
pkgver() {
	cd "$srcdir/$pkgname"
	svnversion | tr -d [A-Z]
}



build() {
	cd "$srcdir/$pkgname"
	
	sed "s|'ratproxy-back.png'|'file:///usr/share/$pkgname/ratproxy-back.png'|" -i ratproxy-report.sh
	sed "s|messages.list|/usr/share/$pkgname/messages.list|" -i ratproxy-report.sh
	sed "s|\"flare\"|\"/usr/bin/ratproxy-flare\"|g" -i ratproxy.c
	sed "s|\"./flare\"|\"/usr/bin/ratproxy-flare\"|" -i ratproxy.c
	sed "s|\"keyfile.pem\"|\"/usr/share/$pkgname/keyfile.pem\"|" -i ssl.c

	make
}

package() {
	cd "$srcdir/$pkgname"

	install -m755 -D ratproxy $pkgdir/usr/bin/ratproxy
	install -m755 ratproxy-report.sh $pkgdir/usr/bin/ratproxy-repost.sh
	install -m755 flare-dist/flare $pkgdir/usr/bin/ratproxy-flare
	install -m644 -D ratproxy-back.png $pkgdir/usr/share/$pkgname/ratproxy-back.png
	install -m644 -D messages.list $pkgdir/usr/share/$pkgname/messages.list
	install -m644 keyfile.pem $pkgdir/usr/share/$pkgname/keyfile.pem
	install -m644 -D doc/README $pkgdir/usr/share/doc/$pkgname/README
}
