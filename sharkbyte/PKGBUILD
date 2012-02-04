# Contributor: wooptoo <wooptoo@gmail.com>

pkgname=sharkbyte
pkgver=0.9.15h
pkgrel=3
arch='i686'
pkgdesc="Client for Grooveshark"
url="http://grooveshark.com/download"
license="custom"
depends=(jre)
makedepends=(rpmextract)
source=($pkgname.rpm)
md5sums=(f3b4c6576eceffa11c4784f86aca7bb9)


build() {
	cd $startdir/src/
	rpmextract.sh $pkgname.rpm
	cp -r usr/ $startdir/pkg/

	cd $startdir/pkg/
	find . -type d -exec chmod 755 {} \;
	find . -type f -exec chmod 644 {} \;
	chmod 755 usr/bin/$pkgname
	chmod 755 usr/lib/$pkgname/$pkgname.sh
	chmod 755 usr/lib/$pkgname/lib/MD5.so

	mkdir -p usr/share/licenses/$pkgname/
	cp usr/lib/$pkgname/terms.rtf usr/share/licenses/$pkgname/
}
