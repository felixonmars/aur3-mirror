pkgname=brother-dcpj132w
pkgver=3.0.0
pkgrel=1
pkgdesc="Brother cupd and lpd driver for DCP-J132W"
arch=('i686' 'x86_64')
url="http://welcome.solutions.brother.com/bsc/public_s/id/linux/en/download_prn.html#DCP-J132W"
license=('custom')

if [ "$(uname -m)" = "x86_64" ]; then
 depends=('lib32-glibc' 'psutils')
else
 depends=('psutils')
fi
install=dcpj132w.install
source=(http://www.brother.com/pub/bsc/linux/dlf/dcpj132wlpr-3.0.0-1.i386.deb
        http://www.brother.com/pub/bsc/linux/dlf/dcpj132wcupswrapper-3.0.0-1.i386.deb
        cupswrapper-systemd.patch
)

sha256sums=('e73b551016a5de13b5c95e042958d3491b7cd9c148e02480188c6ff08797cb77'
            '678d69f4dc7c19b76a2dd89b213b6176dda72de3e34b95cde035a15b0bccc104'
            '2a4d91e6eeafcb864e2cd149a881fa3d2f2c660a7231a53605144eeb968d80e8')

build() {
  srcdir="$startdir/src"
  mkdir -p "$srcdir" && cd "$srcdir"

  for i in $startdir/*.deb; do
    ar -x $i
    bsdtar xf data.tar.gz
  done
  echo "Patching file for systemd compatibility"
  patch $srcdir/opt/brother/Printers/dcpj132w/cupswrapper/cupswrapperdcpj132w < cupswrapper-systemd.patch
}

package() {
  srcdir="$startdir/src"
  cd $srcdir

  install -d -m755 "$pkgdir/usr/lib/cups/filter"
  install -d -m755 "$pkgdir/usr/lib64/cups/filter"
  install -d -m755 "$pkgdir/usr/share/cups/model/Brother"
  install -d -m755 "$pkgdir/usr/share/ppd/Brother"

  cp -r "$srcdir/usr" "$pkgdir"
  cp -r "$srcdir/opt" "$pkgdir"
  cp "$srcdir/opt/brother/Printers/dcpj132w/cupswrapper/brother_dcpj132w_printer_en.ppd" "$pkgdir/usr/share/cups/model/Brother"
  cp "$srcdir/opt/brother/Printers/dcpj132w/cupswrapper/brother_dcpj132w_printer_en.ppd" "$pkgdir/usr/share/ppd/Brother"
  

}

