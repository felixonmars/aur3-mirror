# Maintainer: Marc Menghin <marc.menghin@gmail.com>

pkgname=brother-dcpj525w
pkgver=1.0.0
pkgrel=1
pkgdesc="Brother cups and lpr printer driver for DCP-J525W"
arch=('i686' 'x86_64')
url="http://support.brother.com/g/b/downloadlist.aspx?c=gb&lang=en&prod=dcpj525w_eu_as&os=128"
license=('custom:Brother_Software_Open')
if [ "$(uname -m)" = "x86_64" ]; then
 depends=('lib32-glibc' 'psutils')
else
 depends=('psutils')
fi

install=dcpj525w.install

source=(http://www.brother.com/pub/bsc/linux/dlf/dcpj525wcupswrapper-3.0.0-1.i386.deb
        http://www.brother.com/pub/bsc/linux/dlf/dcpj525wlpr-3.0.1-1.i386.deb
        cupswrapper-systemd.patch)

md5sums=('ba2e30bcfdbc48247843efff5d0444ae'
         'e21d56dcd1c2655f903fbc51eaf7e864'
         '8a149ab88a19fdab3ca08efa018370e4')
sha256sums=('1ca7599dfb1e1a5ad7478e116fb8250f2003db07dd98734a7ed2b1fa4e9f5527'
            'cb5ad16b92a88605304f63c33a727513717a51f6ca391956c5f102f7826bc559'
            '47f9c2e89a7297227a972204c72984826c2468f007f2add8f63324a52430a560')

build() {
  srcdir="$startdir/src"
  mkdir -p "$srcdir" && cd "$srcdir"

  for i in $startdir/*.deb; do
    ar -x $i
    bsdtar xf data.tar.gz
  done
  
  echo "Patching file for systemd compatibility"
  patch $srcdir/opt/brother/Printers/dcpj525w/cupswrapper/cupswrapperdcpj525w < cupswrapper-systemd.patch
}

package() {
	srcdir="$startdir/src"
	cd $srcdir
	
	mkdir -p $pkgdir/opt
	cp -R $srcdir/opt/* $pkgdir/opt

	mkdir -p $pkgdir/usr
 	cp -R $srcdir/usr/* $pkgdir/usr

	install -d -m755 "$pkgdir/usr/lib/cups/filter"
  install -d -m755 "$pkgdir/usr/lib64/cups/filter"
  install -d -m755 "$pkgdir/usr/share/cups/model/Brother"
  install -d -m755 "$pkgdir/usr/share/ppd/Brother"

  cp -r "$srcdir/usr" "$pkgdir"
  cp -r "$srcdir/opt" "$pkgdir"
  cp "$srcdir/opt/brother/Printers/dcpj525w/cupswrapper/brother_dcpj525w_printer_en.ppd" "$pkgdir/usr/share/cups/model/Brother"
  cp "$srcdir/opt/brother/Printers/dcpj525w/cupswrapper/brother_dcpj525w_printer_en.ppd" "$pkgdir/usr/share/ppd/Brother"
}

