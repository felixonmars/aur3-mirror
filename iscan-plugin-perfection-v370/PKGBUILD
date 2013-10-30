pkgname=iscan-plugin-perfection-v370
pkgver=1.0.0
pkgrel=2
pkgdesc="iscan plugin for Epson Perfection V37, V370, GT-F740 and GT-S640 scanners."
arch=('i686' 'x86_64')
url="http://download.ebz.epson.net/dsc/search/01/search/?OSC=LX"
license=('AVASYS PUBLIC LICENSE')
depends=('iscan' 'iscan-data')
install=iscan-plugin-perfection-v370.install

if [ "$CARCH" = 'i686' ] ; then
  source=(http://a1227.g.akamai.net/f/1227/40484/1d/download.ebz.epson.net/dsc/f/01/00/02/02/24/481aef131c7b2bdc7a5ee143ae8bfed1c4b37366/${pkgname}_${pkgver}-2_i386.deb)
  ARCH=i386
  md5sums=('bdd1509fc835136d8c5b6e100b4165e9')
elif [ "$CARCH" = 'x86_64' ] ; then
  source=(http://a1227.g.akamai.net/f/1227/40484/1d/download.ebz.epson.net/dsc/f/01/00/02/02/24/b80ac5de3ba5444cb77e10b89e545fc941a794ad/${pkgname}_${pkgver}-2_amd64.deb)
  ARCH=amd64
  md5sums=('868f80c249108ee959c032a2a56088f7')
fi


package() {
    msg "Extracting..."
    ar -xv ${pkgname}_${pkgver}-2_$ARCH.deb
    tar -xvf data.tar.gz
    msg2 "Done extracting!"
    msg "Moving files"
    mv $srcdir/usr $pkgdir
    msg2 "Done moving files"
 
}
