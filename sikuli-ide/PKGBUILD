#Maintainer: foobster <esangaline@gmail.com>
pkgname=sikuli-ide
__pkgalias=Sikuli-X
pkgver=1.0rc3
pkgrel=1
pkgdesc='A visual technology to search and automate graphical user interfaces using screenshots'
arch=('i686' 'x86_64')
license=('MIT')
url="http://www.sikuli.org"
depends=('java-environment' 'opencv-old-alt' 'wmctrl' 'libtiff4')
if [ $CARCH = "x86_64" ]; then
    _sikuli_md5='dd2b688fbb9485118972656e85844c6e'
else    
    _sikuli_md5='0b7d53e193fadbc948623e739f503877'
fi                
source=('http://doc.sikuli.org/_static/ide-icon-64.png' 'sikuli-ide.desktop' 
        http://launchpad.net/sikuli/sikuli-x/x1.0-rc3/+download/${__pkgalias}-${pkgver}%20\(r905\)-linux-${CARCH}.zip) 
md5sums=('c35442418366e6b10bb17751613cbcc6'
         '49df2c8d87c5a55fa50e8216169f4c7f'
         $_sikuli_md5)         

package(){
    ##Desktop
    mkdir -p $pkgdir/usr/share/{applications,pixmaps} 
    install -m644 ide-icon-64.png $pkgdir/usr/share/pixmaps 
    install -m644 sikuli-ide.desktop $pkgdir/usr/share/applications 

    ##License###
    cd ${__pkgalias}-${pkgver}\ \(r905\)-linux-${CARCH}
    install -Dm644 copyright.txt $pkgdir/usr/share/licenses/$pkgname/LICENSE 

    ##Binary
    mkdir -p $pkgdir/opt/$pkgname
    install -m644 Sikuli-IDE/*.jar $pkgdir/opt/$pkgname
    mkdir -p $pkgdir/opt/$pkgname/libs
    install -m644 Sikuli-IDE/libs/*.so $pkgdir/opt/$pkgname/libs
    cd Sikuli-IDE
    sed 's/DIR=`dirname $0`/DIR=\/opt\/sikuli-ide/' -i  sikuli-ide.sh 
    #sed '/opt/ a\cd "/tmp"' -i sikuli-ide.sh 
    mkdir -p $pkgdir/usr/bin
    install -m755 sikuli-ide.sh $pkgdir/opt/$pkgname
    ln -s /opt/${pkgname}/sikuli-ide.sh $pkgdir/usr/bin/sikuli-ide.sh
}

