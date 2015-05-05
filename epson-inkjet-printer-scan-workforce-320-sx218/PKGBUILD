# Contributor: Alseland

pkgname=epson-inkjet-printer-scan-workforce-320-sx218
_pkgsurname=epson-inkjet-printer-workforce-320-sx218
_pkgname_filter=epson-inkjet-printer-filter
_suffix=1lsb3.2.src.rpm
pkgver=1.0.0
pkgrel=8
pkgdesc="Epson printer and Iscan driver, full auto configure (ME Office 520, 620F / Stylus NX220, SX218, TX220, TX228 / Stylus Office BX305F, BX305FW, TX320F, TX325F / WorkForce 320, 323, 325)"
arch=('i686' 'x86_64')
url="http://download.ebz.epson.net/dsc/search/01/search/?OSC=LX"
license=('LGPL' 'custom:Epson Licence Agreement')
depends=('cups' 'ghostscript' 'iscan-data' 'iscan')
#makedepends=('libtool' 'make' 'automake' 'autoconf')
install="${pkgname}.install"
source=(http://download.ebz.epson.net/dsc/op/stable/SRPMS/${_pkgsurname}-${pkgver}-${_suffix})

build() {
  cd "$srcdir"
  FILTER_FILE1=`ls $_pkgsurname*.tar.gz`
  tar xzf $FILTER_FILE1
  FILTER_FILE=`ls $_pkgname_filter*.tar.gz`
  tar xzf $FILTER_FILE

  cd "${FILTER_FILE%.tar.gz}"
  aclocal
  libtoolize
  chmod +x configure
  # if you have runtime problems: add "--enable-debug" and look into /tmp/epson-inkjet-printer-filter.txt
  ./configure LDFLAGS="$LDFLAGS -Wl,--no-as-needed" --prefix=/opt/${FILTER_FILE1%.tar.gz}
  make
}

package() {
  cd "$srcdir"
  FILTER_FILE1=`ls $_pkgsurname*.tar.gz`
  cd "${FILTER_FILE1%.tar.gz}"
  
  install -d "$pkgdir/opt/${FILTER_FILE1%.tar.gz}/"
  if [ "$CARCH" = "x86_64" ]; then
     cp -a lib64 "$pkgdir/opt/${FILTER_FILE1%.tar.gz}/"
  else
     cp -a lib "$pkgdir/opt/${FILTER_FILE1%.tar.gz}/"
  fi
  cp -a resource "$pkgdir/opt/${FILTER_FILE1%.tar.gz}/"

  if [ -e "watermark" ]; then
      cp -a watermark "$pkgdir/opt/${FILTER_FILE1%.tar.gz}/"
  fi
  install -d "$pkgdir/usr/share/cups/model/${FILTER_FILE1%.tar.gz}"
  install -m 644 ppds/* "$pkgdir/usr/share/cups/model/${FILTER_FILE1%.tar.gz}"

  cd "$srcdir"
  FILTER_FILE=`ls $_pkgname_filter*.tar.gz`
  cd "${FILTER_FILE%.tar.gz}"
  install -d "$pkgdir/opt/${FILTER_FILE1%.tar.gz}/cups/lib/filter/"
  install -m 755 src/epson_inkjet_printer_filter "$pkgdir/opt/${FILTER_FILE1%.tar.gz}/cups/lib/filter/epson_inkjet_printer_filter"

  cd "$startdir"
  install -d "$pkgdir/etc/udev/rules.d/"
  mv 10-usbprinter.rules "$pkgdir/etc/udev/rules.d/10-usbprinter.rules"
}
sha256sums=('c4b69b0ec30e76f1acceeca8e31e7f03812a44464781225600c7ae68f4a6c29c')
