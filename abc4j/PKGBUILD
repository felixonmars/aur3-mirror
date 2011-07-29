# Contributor: Eric Forgeot < http://ifiction.free.fr >
pkgname=abc4j
pkgver=0.5
pkgrel=1
pkgdesc="Java library which provides ABCynth + API to handle abc musical notation."
arch=(i686 x86_64)
url="http://code.google.com/p/abc4j/"
license=('GPL')
depends=('java-runtime')

source=(http://abc4j.googlecode.com/files/abc4j_v0.5.jar)
md5sums=('f1060e980491ed030a5ddec848f4b26b')


build() {
  cd $srcdir/

    mkdir -p $pkgdir/usr/share/${pkgname}
    mkdir -p $pkgdir/usr/bin
    
    cp -fr $srcdir/../abc4j_v0.5.jar $pkgdir/usr/share/${pkgname} 
    cp -fr $srcdir/ReleaseNotes.txt $pkgdir/usr/share/${pkgname}

    
	echo "java -jar /usr/share/abc4j/abc4j_v0.5.jar $1" > $pkgdir/usr/bin/${pkgname}
	echo "java -jar /usr/share/abc4j/abc4j_v0.5.jar $1" > $pkgdir/usr/bin/abcynth
	
	chmod +x $pkgdir/usr/bin/*
	
	
	#desktop icons
	#mkdir -p $pkgdir/usr/share/pixmaps
	mkdir -p $pkgdir/usr/share/applications
    
	#cp $srcdir/../$pkgname.png $pkgdir/usr/share/pixmaps/$pkgname.png
	
	install -D -m644 $srcdir/../$pkgname.desktop $pkgdir/usr/share/applications/$pkgname.desktop
}


