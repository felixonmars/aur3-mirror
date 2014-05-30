# Contributer: giacomogiorgianni@gmail.com

pkgname=rphoto
_name=RPhoto
pkgver=0.4.3
pkgrel=1
pkgdesc="RPhoto is is small software aiming at the easy handling of digital camera's photos"
arch=('i686' 'x86_64')
license=('GPL')
url="http://people.via.ecp.fr/~remi/soft/rphoto/rphoto_en.php3/"
depends=('wxgtk2.8' 'exif' 'libjpeg-turbo')
makedepends=()
#source=(http://people.via.ecp.fr/%7Eremi/soft/rphoto/${pkgname}_src.tar.gz)
source=(http://ppa.launchpad.net/dhor/myway/ubuntu/pool/main/r/${pkgname}/${pkgname}_${pkgver}.orig.tar.gz)
md5sums=('1cf7d8a7101689ab1d25522fe1d7fe80')

package() {
  cd $srcdir/${pkgname}-${pkgver}
  ./configure --prefix=/usr --mandir=/usr/share/man LDFLAGS=-ljpeg --with-wx-config=/usr/bin/wx-config-2.8
  
  make clean && make 
  make DESTDIR=$pkgdir install
 
  # desktop file
  install -Dm644 "$srcdir/${pkgname}-${pkgver}/build/debian/$pkgname.desktop" \
    "$pkgdir/usr/share/applications/$pkgname.desktop"
  
  sed -i '10s|share/rphoto|share/pixmaps|' "$pkgdir/usr/share/applications/$pkgname.desktop"
  
  # icon
  install -Dm644 "$srcdir/${pkgname}-${pkgver}/build/debian/$pkgname.xpm" \
    "$pkgdir/usr/share/pixmaps/$pkgname.xpm"
}
