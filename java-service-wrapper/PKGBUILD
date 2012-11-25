# $Id: pkgbuild-mode.el,v 1.23 2007/10/20 16:02:14 juergen Exp $
# Maintainer: Artyom Olshevskiy <siasia@siasia>
pkgname=java-service-wrapper
pkgver=3.5.16
pkgrel=2
pkgdesc="Enables a Java Application to be run as a Windows Service or Unix Daemon"
url="http://wrapper.tanukisoftware.com/"
arch=('i686' 'x86_64')
license=('GPL')
depends=(java-runtime)
conflicts=()
replaces=()
backup=()
install=
if [ "$CARCH" = "i686" ]; then
_pkgarch=32
source=(http://wrapper.tanukisoftware.com/download/$pkgver/wrapper-linux-x86-$_pkgarch-$pkgver.tar.gz)
md5sums=('272ba82d2f85bac5db321d4fbc5b061e')
else
_pkgarch=64
source=(http://wrapper.tanukisoftware.com/download/$pkgver/wrapper-linux-x86-$_pkgarch-$pkgver.tar.gz)
md5sums=('1300b88a3f19915db59248d9faf81332')
fi
build() {
	:
}
package() {
	install -d $pkgdir/usr/share/doc/java-service-wrapper
	cd $srcdir/wrapper-linux-x86-$_pkgarch-$pkgver
	install -Dm644 README* $pkgdir/usr/share/doc/java-service-wrapper
	install -Dm644 conf/wrapper.conf $pkgdir/usr/share/doc/java-service-wrapper
	install -Dm644 doc/index.html $pkgdir/usr/share/doc/java-service-wrapper
	install -Dm644 doc/revisions.txt $pkgdir/usr/share/doc/java-service-wrapper/changelog
	install -m644 doc/wrapper-community-license-1.1.txt $pkgdir/usr/share/doc/java-service-wrapper/LICENSE
	install -m644 src/bin/sh.script.in $pkgdir/usr/share/doc/java-service-wrapper
	install -Dm755 bin/wrapper $pkgdir/usr/sbin/java-service-wrapper
	install -Dm644 lib/wrapper.jar $pkgdir/usr/share/java/java-service-wrapper/wrapper.jar
	install -Dm644 lib/libwrapper.so $pkgdir/usr/lib/java-service-wrapper/libwrapper.so
}
