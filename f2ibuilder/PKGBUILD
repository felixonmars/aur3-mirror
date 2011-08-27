# Contributor: David Ferreira - FZ <davidferreira.fz at gmail.com>

pkgname=f2ibuilder
pkgver=3.8
pkgrel=5
arch=('i686')
pkgdesc="A generator of bitmap fonts, opensource and multiplatform"
url="http://f2ibuilder.sf.net"
depends=('jre')
license=('GPL')
source=(http://downloads.sourceforge.net/project/f2ibuilder/F2IBuilder/3.x/F2IBuilder.3.8.bin.all.zip \
        ${pkgname}.png)

md5sums=('197c72a911956e433a2b78d6de065667'
         '24e4eb1615751953f4f85d875df70171')


build() {
    mkdir -p ${pkgdir}/usr/share/java
    mkdir -p ${pkgdir}/usr/share/applications

    install -D -m644 ${pkgname}.png ${pkgdir}/usr/share/pixmaps/${pkgname}.png

    chmod -s -R ${startdir}/src/F2IBuilder
    mv ${startdir}/src/F2IBuilder ${pkgdir}/usr/share/java

    #Criando atalho
    FILE=${pkgdir}/usr/share/applications/F2IBuilder.desktop

cat > $FILE << EOF
[Desktop Entry]
Name=F2IBuilder
Icon=f2ibuilder
GenericName=Bitmap font generator
GenericName[pt_BR]=Gerador de Fontes
Comment=A generator of bitmap fonts, opensource and multiplatform
Exec=java -jar /usr/share/java/F2IBuilder/F2IBuilder.jar
Terminal=false
Type=Application
Categories=Application;Development;
StartupNotify=true
EOF


}
