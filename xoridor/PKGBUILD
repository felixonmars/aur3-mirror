# Contributer: Xavier de Labouret <arch@2-lab.net>
pkgname=xoridor
pkgver=0.4
pkgrel=3
pkgdesc="A boardgame, where you have to reach the last rank. Players can block each other by placing walls on the board."
arch=('i686' 'x86_64')
url="https://sourceforge.net/projects/xoridor/"
license="GPL"
depends=('java-runtime')
source=(http://dl.sourceforge.net/sourceforge/$pkgname/$pkgname-$pkgver.jar)
md5sums=('8865ef5ad9692d8ea19bea08a87c2d66')

build() {
	mkdir -p $startdir/pkg/usr/bin
	cd $startdir/src
	install -D -m644 $pkgname-$pkgver.jar \
	$startdir/pkg/usr/share/java/$pkgname/$pkgname-$pkgver.jar

	# Create the binary
	cat > $startdir/pkg/usr/bin/$pkgname << "EOF"
#!/bin/sh

CP=/usr/share/java/$pkgname/xoridor-0.4.jar

exec java -cp $CLASSPATH:$CP -jar /usr/share/java/xoridor/xoridor-0.4.jar
EOF
	chmod 775 $startdir/pkg/usr/bin/$pkgname
}

