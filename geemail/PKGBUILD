pkgname=geemail
pkgver=1.0
pkgrel=1
pkgdesc="An Adobe AIR Desktop Client for checking Gmail but with more features"
arch=('any')
url="http://www.sourcebits.com/geemail"
license=('custom')
depends=('adobe-air')
makedepends=('unzip')
source=(http://www.sourcebits.com/$pkgname/$pkgname.zip)
md5sums=('162f74032755bd88b3e0b6002a7249c6')

build(){
    cd ${startdir}/src
    mkdir -p ${startdir}/pkg/opt/geemail
    mkdir -p ${startdir}/src/$pkgname
    unzip -o $pkgname.zip -d ${startdir}/src/$pkgname
    cd $pkgname
    unzip -o $pkgname.air -d ${startdir}/src
    cp $pkgname.air ${startdir}/pkg/opt/$pkgname

    echo "[Desktop Entry]" > ${startdir}/src/geemail.desktop
    echo "Categories=Application;Network;" >> ${startdir}/src/geemail.desktop
    echo "Comment=Adobe Air desktop client for checking Gmail but with more features" >> ${startdir}/src/geemail.desktop
    echo "Encoding=UTF-8" >> ${startdir}/src/geemail.desktop
    echo "Exec=adobe-air /opt/geemail/geemail.air" >> ${startdir}/src/geemail.desktop
    echo "GenericName=GeeMail" >> ${startdir}/src/geemail.desktop
    echo "Hidden=false" >> ${startdir}/src/geemail.desktop
    echo "Icon=geemail.png" >> ${startdir}/src/geemail.desktop
    echo "MimeType=application/vnd.adobe.air-application-installer-package+zip" >> ${startdir}/src/geemail.desktop
    echo "Name=GeeMail" >> ${startdir}/src/geemail.desktop
    echo "Terminal=false" >> ${startdir}/src/geemail.desktop
    echo "Type=Application" >> ${startdir}/src/geemail.desktop

    install -m644 -D ${startdir}/src/assets/images/mail.png ${startdir}/pkg/usr/share/pixmaps/geemail.png
    install -m644 -D ${startdir}/src/$pkgname/$pkgname.air ${startdir}/pkg/opt/$pkgname
    install -m644 -D ${startdir}/src/geemail.desktop ${startdir}/pkg/usr/share/applications/geemail.desktop
}
