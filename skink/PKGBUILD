# Contributor: Eric Forgeot < http://ifiction.free.fr >
# Mantainer: Luis Pablo Gasparotto < lpgasparotto at gmail dot com >
pkgname=skink
pkgver=2alpha
pkgrel=2
pkgdesc="A java application which supports the abc musical notation 1.6 standard with some extensions."
arch=(i686 x86_64)
url="http://celticmusic.ca/skink.html"
license=('freeware')
depends=('java-runtime')
#source=(http://celticmusic.ca/${pkgname}.tar.gz)
source=(http://celticmusic.ca/skinkbeta/Skink2_0AlphaLinuxWin.zip)
md5sums=('7dd96b3c19a0fff3e113ba6b4d3fcfe5')

build() {    

    mkdir -p $pkgdir/usr/share/skink
    mkdir -p $pkgdir/usr/share/applications
    #mkdir -p $pkgdir/usr/share/pixmaps
    mkdir -p $pkgdir/usr/bin
    
    cp -fr $srcdir/Skink2_0AlphaLinuxWin/* $pkgdir/usr/share/skink 

    #echo "java -jar -Dswing.defaultlaf=com.sun.java.swing.plaf.gtk.GTKLookAndFeel /usr/share/skink/Skink.jar" > $pkgdir/usr/bin/skink
	
	echo "java -Dca.celticmusic.skink.abctool=abcm2ps -Dswing.defaultlaf=com.sun.java.swing.plaf.gtk.GTKLookAndFeel -cp /usr/share/skink/Skink.jar:/usr/share/skink/MRJAdapter.jar ca.celticmusic.skink.Skink $1" > $pkgdir/usr/bin/skink
	

    chmod +x $pkgdir/usr/bin/skink
	
    #cp $srcdir/../skink.png $pkgdir/usr/share/pixmaps/
    install -D -m644 $srcdir/../skink.desktop $pkgdir/usr/share/applications
    
    
}
