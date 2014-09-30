# Maintainer: Baobab <baobab//heresiarch.info>
# Contributor: Eric Le Bras <eric.lebras@gmail.com>

pkgname=impro-visor
pkgver=6.0
pkgrel=1
pkgdesc="Jazz Improvisation Advisor for the Improviser"
arch=('any')
url="http://impro-visor.com/"
license=('GPL')
depends=('java-runtime')
makedepends=('unzip' 'java-environment')
install="impro-visor.install"
source=(http://downloads.sourceforge.net/${pkgname}/Impro-Visor%20$pkgver%20Release/${pkgname/-}${pkgver/.}0.zip
	http://downloads.sourceforge.net/${pkgname}/Impro-Visor%20$pkgver%20Release/${pkgname/-}${pkgver/.}0-src.zip
	$pkgname.sh
	$pkgname.desktop
	directories.patch)
noextract=(${pkgname/-}${pkgver/.}0-src.zip)
   
md5sums=('3d6d966c28eca3a409ee309eed034ab8'
         'fefb2cc75399703e1c747079b7970a89'
         'dfddb4fb8d24b5bd9cb60d4446239ba6'
         '9186b8da7df3d732ecadbda3b3501ffc'
         '7db9aae82b0472eee79c6ec2a28dc897')
         
build() {
	cd "$srcdir"
	# apply config location patch
	unzip "${pkgname/-}${pkgver/.}0-src.zip" "imp/Directories.java"
	cd "$srcdir/imp"
	patch -Np1 -i ../directories.patch
	javac Directories.java
	rm Directories.java
	cd ..
	zip -r improvisor.jar imp
	rm -rf imp
	# install readme & license
	install -Dm644 "$srcdir/README.txt" "$pkgdir/usr/share/doc/$pkgname/README"
	install -Dm644 "$srcdir/LICENSE.txt" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
	rm *.txt
	# install files
    find . -type f -name "*.jar" | while read f; do
		install -Dm644 "$f" "$pkgdir/usr/share/java/$pkgname/${f:2}"
		rm "$f"
	done
	find . -type f ! -name "*.jar" | while read f; do
		install -Dm644 "$f" "$pkgdir/usr/share/$pkgname/${f:2}"
	done
	# install script, launcher & icon
	install -Dm755 "$srcdir/$pkgname.sh" "$pkgdir/usr/bin/$pkgname"
	install -Dm644 "$srcdir/$pkgname.desktop" "$pkgdir/usr/share/applications/$pkgname.desktop"
	unzip -j "${pkgname/-}${pkgver/.}0-src.zip" "imp/gui/graphics/icons/trumpetsmall.png"
	install -Dm644 "$srcdir/trumpetsmall.png" "$pkgdir/usr/share/pixmaps/$pkgname.png"
}
