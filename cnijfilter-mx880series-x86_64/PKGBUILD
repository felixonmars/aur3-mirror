# Contributor: Jeff Backer

pkgname=cnijfilter-mx880series-x86_64
pkgver=3.50
pkgrel=3
pkgdesc="Canon IJ Printer Driver (MX880 Series) x86_64"
url="http://usa.canon.com/cusa/consumer/products/printers_multifunction/office_all_in_one_inkjet_printers/pixma_mx882"
arch=('x86_64')
license=('custom')
depends=('libcups' 'popt' 'libpng12' 'libtiff3' 'krb5' 'ghostscript')
source=(http://dl.dropbox.com/u/112686/aur/cnijfilter-mx880series-3.50.x86_64.tar.gz)
md5sums=('5c40a496db33d507245fc5cb1e4ed3d9')

build() {
  cd $pkgdir
  tar -xzf $startdir/src/cnijfilter-mx880series-$pkgver.x86_64.tar.gz
  mkdir -p $pkgdir/usr/share/licenses/${pkgname}
  cp -r $pkgdir/usr/share/doc/cnijfilter-mx880series-$pkgver/* $pkgdir/usr/share/licenses/${pkgname}
  
  chmod -R 755 "$pkgdir/usr/"
  find "$pkgdir/usr/lib/cups/" -type f -exec chmod 555 {} \;
  chown -R root:root "$pkgdir/usr/"
}
