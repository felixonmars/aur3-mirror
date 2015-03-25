# Maintainer: Frederic Bezies < fredbezies at gmail dot com>
# Contributor: garion < garion @ mailoo.org >
# Contributor: Alessio Sergi <asergi at archlinux dot us>

pkgname=iscan
pkgver=2.30.1
pkgrel=5
pkgdesc="A front-end for EPSON scanner/all-in-ones"
arch=('i686' 'x86_64')
url="http://download.ebz.epson.net/dsc/search/01/search/?OSC=LX"
license=('GPL2' 'custom:AVASYSPL')
depends=('gtk2' 'sane' 'libtiff' 'iscan-data')
makedepends=('gettext')
conflicts=(${pkgname}-legacy)
install=${pkgname}.install
backup=(etc/sane.d/epkowa.conf)
options=('!libtool')
source=('https://download3.ebz.epson.net/dsc/f/03/00/03/61/59/a3f8b8d60e8702a1c5bf3977d018cc2336e308a8/iscan_2.30.1-1.tar.gz'
        'iscan-2.28.1-libpng15.patch')
md5sums=('2ba2043973f149d5a2d0468bf76d0030'
         'fc7db347c301683c01376056898f2792')



build() {
  cd "$srcdir/$pkgname-$pkgver"
  export LDFLAGS="${LDFLAGS} -ldl -lpng16"

  # patch for building iscan against libpng15 by giovanni
  patch -Np0 -i "${srcdir}/iscan-2.28.1-libpng15.patch"

  ./configure --prefix=/usr \
              --enable-dependency-reduction \
              --enable-frontend \
              --enable-jpeg \
              --enable-tiff \
              --enable-png --disable-gimp
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make DESTDIR="${pkgdir}" install

  # install iscan-registry in /usr/bin
  # it is not really clean, will try something better later :)
  install -D -m655 ${pkgdir}/usr/sbin/iscan-registry "${pkgdir}/usr/bin/iscan-registry"
  rm -rf ${pkgdir}/usr/sbin/

  # install sane file config
  install -d -m755 "$pkgdir/etc/sane.d"
  install -m644 backend/epkowa.conf "$pkgdir/etc/sane.d/epkowa.conf"

  # install desktop file
  install -d -m755 "$pkgdir/usr/share/applications"
  install -m644 "$pkgname.desktop" "$pkgdir/usr/share/applications/$pkgname.desktop"

  # install license
  install -d -m755 "$pkgdir/usr/share/licenses/$pkgname"
  install -m644 "non-free/AVASYSPL.en.txt" "$pkgdir/usr/share/licenses/$pkgname/AVASYSPL"
}
