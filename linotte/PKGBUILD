# Contributor: Eric Forgeot < http://ifiction.free.fr >
pkgname=linotte
pkgver=1.4.0
pkgrel=1
pkgdesc="A simple programming system in natural langage (French only)"
arch=(any)
url="http://langagelinotte.free.fr/"
license=('gpl')
depends=('java-runtime' 'bash')
source=(http://langagelinotte.googlecode.com/files/Linotte_${pkgver}.zip http://langagelinotte.googlecode.com/files/DecouvrirLinotte2010C.pdf)

md5sums=('e21b4284fb11f1cd542de4fe35a32e69'
         '86283e89b39676c7ee3359e0af91d682')

build() {
    cd $srcdir/
    rm *.exe
    rm *.dll
    rm *.bat
    rm Linotte_*.zip
    
    mkdir -p $pkgdir/usr/share/linotte
    mkdir -p $pkgdir/usr/bin
    
    cp -fr * $pkgdir/usr/share/linotte
    rm -fr $pkgdir/usr/share/linotte/*.pdf
    cp -fr ../*.pdf $pkgdir/usr/share/linotte/
    

    
    echo "cd /usr/share/linotte
java -jar Linotte.jar" > $pkgdir/usr/bin/linotte

    echo "cd /usr/share/linotte
java -jar jinotte.jar \$1 \$2" > $pkgdir/usr/bin/jinotte

    chmod +x $pkgdir/usr/bin/linotte
    chmod +x $pkgdir/usr/bin/jinotte
    #java -jar Linotte.jar -xw livre.liv

 #desktop icons
	mkdir -p $pkgdir/usr/share/pixmaps
	mkdir -p $pkgdir/usr/share/applications

	cp $srcdir/../$pkgname.png $pkgdir/usr/share/pixmaps/$pkgname.png
	
	install -D -m644 $srcdir/../$pkgname.desktop $pkgdir/usr/share/applications/$pkgname.desktop

}
