# Contributor: JP Hastings-Spital <jphastings@gmail.com>

pkgname=puzzle-pirates
pkgver=1.0
pkgrel=1
pkgdesc="An online multi-user pirate game"
depends=('j2re')
source=('http://www.puzzlepirates.com/yoclient/yohoho-install.bin')
md5sums=('a3ccb64babd1fdd5507a0534ac1d10fc')
url="http://www.puzzlepirates.com/"
license=

build() {
	cd $startdir/src
	#games go to /usr/share/games/
	cat yohoho-install.bin | sed '/#!\/bin\/sh/,/exit \$res/d' > tmp.tar.gz
	mkdir -p ../pkg/usr/share/games/yohoho
	mkdir ../pkg/usr/bin
	tar -xvf tmp.tar.gz -C ../pkg/usr/share/games/yohoho/
	cd ../pkg/usr/share/games/yohoho/
	rm finish_install.sh
	
	#make the JAVA symlink
	ln -s $JAVA_HOME java
	
	echo "sh /usr/share/games/yohoho/yohoho" > $startdir/pkg/usr/bin/puzzle-pirates
	chmod +x $startdir/pkg/usr/bin/puzzle-pirates
}
