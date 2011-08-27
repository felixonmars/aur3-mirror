# Contributor: Eric Forgeot < http://ifiction.free.fr >
pkgname=blorple
pkgver=0.4
pkgrel=2
pkgdesc="An Interactive Fiction metadata browser, written in Java"
arch=(i686 x86_64)
url="http://blorple.sourceforge.net/"
license=('gpl')
depends=('java-runtime')
source=(http://downloads.sourceforge.net/sourceforge/${pkgname}/${pkgname}-${pkgver}.jar)
md5sums=('389f62ae2c3312b0d32412c814117534')


build() {    

    mkdir -p $pkgdir/usr/share/blorple
    mkdir -p $pkgdir/usr/share/applications
    mkdir -p $pkgdir/usr/share/pixmaps
    mkdir -p $pkgdir/usr/bin
    
    cp $srcdir/${pkgname}-${pkgver}.jar $pkgdir/usr/share/blorple 
    cp $srcdir/../blorple.properties $pkgdir/usr/share/blorple

    echo "cd /usr/share/blorple
java -jar ${pkgname}-${pkgver}.jar" > $pkgdir/usr/bin/blorple

    echo "if [ ! -e ~/.blorple  ]; then
mkdir ~/.blorple 
fi
cp /usr/share/blorple/blorple.properties ~/.blorple" > $pkgdir/usr/share/blorple/blorple_applications.sh

    chmod +x $pkgdir/usr/bin/blorple
    chmod +x $pkgdir/usr/share/blorple/blorple_applications.sh
    
    cp $srcdir/../blorple.png $pkgdir/usr/share/pixmaps/
    install -D -m644 $srcdir/../blorple.desktop $pkgdir/usr/share/applications
    
    echo -e "\n Run /usr/share/blorple/blorple_applications.sh as user to create a default config file for using with the gargoyle interpreter \n"
    
}
