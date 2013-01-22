# Contributor: Samed Beyribey <ras0ir@eventualis.org>
pkgname=zemberek-server-nolibs
pkgver=0.7.1
pkgrel=2
url="http://code.google.com/p/zemberek"
pkgdesc='A Turkish spell checker server based on Zemberek NLP library'
arch=('i686' 'x86_64')
license=('MPL')
provides=('zemberek-server')
groups=('zemberek')
replaces=('zemberek-server')
conflicts=('zemberek-server')
depends=('java-runtime' 'dbus' 'libmatthew-java' 'dbus-java' 'apache-mina' 'zemberek-nolibs')
makedepends=('apache-ant' 'java-environment' 'dbus-java' 'apache-mina' 'zemberek-nolibs')
source=(http://zemberek.googlecode.com/files/zemberek-server-nolibs-$pkgver.tar.gz
	zemberek-server
	zemberek-server.service
	zemberek.conf.d)
md5sums=('769345191af0f28afc780d7306c87cd0'
         '89a31ee75b17dac3e60612952251f9f3'
         '52c4645cc72c930c16c86184204d21c7'
         '216d56e40c9ad34dd843b39c92ca723f')
build() {
	install -d  $pkgdir/etc/dbus-1/system.d
	install -d  $pkgdir/usr/share/java/zemberek
	install -d  $pkgdir/usr/share/licenses/$pkgname
	cd $srcdir
	mkdir lib
	jars=(/usr/share/java/dbus-java/dbus.jar /usr/share/java/mina/mina-core.jar /usr/share/java/zemberek/zemberek-cekirdek.jar /usr/share/java/zemberek/zemberek-tr.jar)
	for lnjars in ${jars[@]}
	do ln -s $lnjars lib/
	done
# Build 'em
	ant || return 1
	install -D -m644 $srcdir/dist/config/conf.ini $pkgdir/etc/zemberek-server.ini
	install -m644 dist/config/zemberek-server.conf $pkgdir/etc/dbus-1/system.d
	install -m644 dist/zemberek-server-$pkgver.jar $pkgdir/usr/share/java/zemberek
        ln -s /usr/share/java/zemberek/zemberek-server-$pkgver.jar $pkgdir/usr/share/java/zemberek/zemberek-server.jar
	install -m644 dist/lisanslar/zemberek-licence.txt $pkgdir/usr/share/licenses/$pkgname
	install -D -m655 $startdir/zemberek-server $pkgdir/usr/bin/zemberek-server
        install -D -m644 $startdir/zemberek-server.service $pkgdir/usr/lib/systemd/system/zemberek-server.service
	install -D -m644 $startdir/zemberek.conf.d $pkgdir/etc/conf.d/zemberek
}
