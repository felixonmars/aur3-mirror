pkgname=brother-dcp1610w
pkgver=3.0.1
pkgrel=1
pkgdesc="Brother cupd and lpd driver for DCP-1610W"
arch=('i686' 'x86_64')
url="http://support.brother.com/g/b/downloadtop.aspx?c=as_ot&lang=en&prod=dcp1610w_eu_as"
license=('custom')

if [ "$(uname -m)" = "x86_64" ]; then
 depends=('lib32-glibc' 'psutils')
else
 depends=('psutils')
fi
source=(http://download.brother.com/welcome/dlf101533/dcp1610wlpr-3.0.1-1.i386.deb
http://download.brother.com/welcome/dlf101532/dcp1610wcupswrapper-3.0.1-1.i386.deb
)
md5sums=('f5c162bd48c79bacdce9e4f674903480'
         '783a9cbc258324d14b10bf91c718920e')

build() {
  srcdir="$startdir/src"
  mkdir -p "$srcdir" && cd "$srcdir"

  for i in $startdir/*.deb; do
    ar -x $i
    bsdtar xf data.tar.gz
  done
}

package() {
  srcdir="$startdir/src"
  cd $srcdir

  install -d -m755 "$pkgdir/usr/lib/cups/filter"
  install -d -m755 "$pkgdir/usr/share/cups/model/Brother"
  install -d -m755 "$pkgdir/usr/share/ppd/Brother"

  cp -r "$srcdir/usr" "$pkgdir"
  cp -r "$srcdir/opt" "$pkgdir"
  cp "$srcdir/opt/brother/Printers/DCP1610W/cupswrapper/brother-DCP1610W-cups-en.ppd" "$pkgdir/usr/share/cups/model/Brother"
  cp "$srcdir/opt/brother/Printers/DCP1610W/cupswrapper/brother-DCP1610W-cups-en.ppd" "$pkgdir/usr/share/ppd/Brother"
  cp "$srcdir/opt/brother/Printers/DCP1610W/cupswrapper/brother_lpdwrapper_DCP1610W" "$pkgdir/usr/lib/cups/filter"
}
