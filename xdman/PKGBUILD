
# Contributer: giacomogiorgianni@gmail.com

pkgname=xdman
pkgver=4.7
pkgrel=25
pkgdesc="Xtreme Download Manager uses sophisticated dynamic segmentation algorithm,data compression and connection reuse to speed up the download proces"
arch=(i686 x86_64)
url="http://xdman.sourceforge.net/index.html"
license=('gpl')
depends=('java-environment')
source=("http://sourceforge.net/projects/$pkgname/files/$pkgname.zip" $pkgname.desktop) 
md5sums=('4770c2880f4e7e31963921abf83fc3a7' '09d03c27af8eee494fb7b830f73085e7')


package() {    

    mkdir -p $pkgdir/usr/share/$pkgname
    mkdir -p $pkgdir/usr/share/applications
    mkdir -p $pkgdir/usr/share/pixmaps
    mkdir -p $pkgdir/usr/bin
    mkdir -p $pkgdir/usr/lib/xdman
    
    cp $srcdir/${pkgname}.jar $pkgdir/usr/share/$pkgname 
   # cp $srcdir/../$pkgname.properties $pkgdir/usr/share/$pkgname

    echo "cd /usr/share/$pkgname
java -jar ${pkgname}.jar" > $pkgdir/usr/bin/$pkgname

#    echo "if [ ! -e ~/.$pkgname  ]; then
#mkdir ~/.$pkgname 
#fi
#cp /usr/share/blorple/blorple.properties ~/.blorple" > $pkgdir/usr/share/blorple/blorple_applications.sh

    chmod +x $pkgdir/usr/bin/$pkgname
    #chmod +x $pkgdir/usr/share/$pkgname/$pkgname_applications.sh

     #sed "7s|/home/mrbit/aur3/xdman/src/||" -i $startdir/$pkgname.desktop
     #sed "9s|/home/mrbit/aur3/xdman/src/||" -i $startdir/$pkgname.desktop
    cp -f -r xdm-helper $pkgdir/usr/lib/xdman/
    find $pkgdir/usr/lib/xdman/xdm-helper -type d -exec chmod 755 {} +
    find $pkgdir/usr/lib/xdman/xdm-helper -type f -exec chmod 644 {} +
   
    cp $srcdir/icon.png $pkgdir/usr/share/pixmaps/
    install -D -m644 $startdir/$pkgname.desktop $pkgdir/usr/share/applications
    cp -f -r xdm-helper $pkgdir/usr/lib/xdman/
   
    #echo -e "\n Run /usr/share/$pkgname/$pkgname_applications.sh as user to create a default config file for using with the gargoyle interpreter \n"
    
}
