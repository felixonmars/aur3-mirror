# Maintainer: Samuel Tardieu <sam@rfc1149.net>
# Contributor: ArLi Weng <arliweng@gmail.com>
# Contributor: Sean Gillespie <Sean.D.Gillespie@gmail.com>
# Contributor: Roberto Alsina <ralsina@kde.org>

pkgname=jamvm
pkgver=1.5.4
pkgrel=1
pkgdesc="A Compact Java Virtual Machine which conforms to the JVM 
specification"
arch=('i686' 'x86_64')
url="http://jamvm.sourceforge.net/"
license=("GPL")
depends=('classpath' 'zlib' 'libffi')
makedepends=('pkg-config')
source=("http://downloads.sourceforge.net/sourceforge/jamvm/$pkgname-$pkgver.tar.gz")
md5sums=('7654e9657691f5f09c4f481ed4686176')

build() {
	cd $startdir/src/$pkgname-$pkgver
	export CFLAGS="$CFLAGS `pkg-config libffi --cflags`"

	./configure --with-classpath-install-dir=/usr \
		--prefix=/usr --enable-ffi

	make || return 1
	make DESTDIR=$pkgdir install || exit 1
	# Avoid conflict with classpath (which jamvm requires)
	install -D $pkgdir/usr/include/jni.h $pkgdir/usr/include/jamvm/jni.h
	rm $pkgdir/usr/include/jni.h
}
