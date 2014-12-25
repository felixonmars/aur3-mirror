# Maintainer: nic96 <jeromyreimer at gmail dot com>

pkgname=jmapview
pkgver=0.5
pkgrel=1
pkgdesc="A mapping application for FlightGear, the open-source flight simulator."
arch=('i686' 'x86_64')
url="http://jmapview.sourceforge.net/"
depends=('java-environment')
license=('GPLv2')
source=("http://sourceforge.net/projects/jmapview/files/jmapview/$pkgver/jMapView.zip"
        "jMapView.desktop"
        "jmapview.png")
md5sums=('7489b48d11527b496c7c336b8030064d'
         '48a36519b2cbcfd0ec337a17352e3669'
         '4848e3d8e7d317ed7b630c89da4249b2')

prepare() {
    cd $srcdir
    rm *.zip
    echo $'#!/bin/bash
mkdir -p $HOME/.jmapview
cd $HOME/.jmapview/
java -jar /opt/jMapView/jMapView.jar
' > jmapview
chmod +x jmapview
}

package() {
    cd $srcdir
    install -d ${pkgdir}/opt/jMapView/
    cp -r ${srcdir}/* ${pkgdir}/opt/jMapView/
    install -Dm644 jMapView.desktop \
    $pkgdir/usr/share/applications/jMapView.desktop
    rm $pkgdir/opt/jMapView/jMapView.desktop
    ln -s /usr/share/applications/jMapView.desktop \
    $pkgdir/opt/jMapView/jMapView.desktop
    install -Dm644 jmapview.png $pkgdir/usr/share/pixmaps/jmapview.png
}

# vim:set ts=2 sw=2 et:
