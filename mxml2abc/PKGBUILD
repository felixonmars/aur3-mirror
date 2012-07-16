# Contributor: Eric Forgeot < http://ifiction.free.fr >
pkgname=mxml2abc
pkgver=1.6
pkgrel=1
pkgdesc="a MusicXML to ABC music notation converter."
arch=(any)
url="http://code.google.com/p/mxml2abc/"
license=('GPLv3')
depends=('java-runtime')

source=(http://mxml2abc.googlecode.com/files/mxml2abc_1.6.jar)
sha1sums=('c433a395697eb3282614fcbf23a8331c0689b19f')


build() {
  cd $srcdir/

    mkdir -p $pkgdir/usr/share/${pkgname}
    mkdir -p $pkgdir/usr/bin
    
    cp -fr $srcdir/../mxml2abc_1.6.jar $pkgdir/usr/share/${pkgname} 

    
	echo -e "java -jar /usr/share/mxml2abc/mxml2abc_1.6.jar \$1" > $pkgdir/usr/bin/${pkgname}
	
	chmod +x $pkgdir/usr/bin/*
	
	
	#desktop icons
	#mkdir -p $pkgdir/usr/share/pixmaps
	#mkdir -p $pkgdir/usr/share/applications
    
	#cp $srcdir/../$pkgname.png $pkgdir/usr/share/pixmaps/$pkgname.png
	
	#install -D -m644 $srcdir/../$pkgname.desktop $pkgdir/usr/share/applications/$pkgname.desktop
}


