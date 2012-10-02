# Maintainer: Mustafa Kılıç <mustafa@fomus.org>

pkgname=iscan-plugin-gt-f700
pkgver=2.1.2
pkgrel=3
pkgdesc="iscan plugin for Epson Perfection Photo V350 scanners."
arch=('i686' 'x86_64')
url="http://download.ebz.epson.net/dsc/search/01/search/?OSC=LX"
license=('AVASYS PUBLIC LICENSE')
depends=('iscan' 'iscan-data')
install=iscan-plugin-gt-f700.install

if [ "$CARCH" = 'i686' ] ; then
  source=(http://a1227.g.akamai.net/f/1227/40484/1d/download.ebz.epson.net/dsc/f/01/00/01/58/36/9b22345464d366422ba5243387d2aa1e3871e74c/${pkgname}_${pkgver}-1_i386.deb)
  ARCH=i386
  md5sums=('c404796afda900b83951436a0f6aa652')
elif [ "$CARCH" = 'x86_64' ] ; then
  source=(http://a1227.g.akamai.net/f/1227/40484/1d/download.ebz.epson.net/dsc/f/01/00/01/58/36/bb608c1728707456b5ca56a6a3fd1a2c8e124eaf/${pkgname}_${pkgver}-1_amd64.deb)
  ARCH=amd64
  md5sums=('4b313029ffeb8300624c88834a3ba968')
fi


package() {
    msg "Extracting..."
    ar -xv ${pkgname}_${pkgver}-1_$ARCH.deb
    tar -xvf data.tar.gz
    msg2 "Done extracting!"
    msg "Moving files"
    mv $srcdir/usr $pkgdir
    msg2 "Done moving files"
 
}
