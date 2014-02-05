pkgname=brother-dcp1510
pkgver=3.0.1
pkgrel=1
pkgdesc="Brother cupd and lpd driver for DCP-1510"
arch=('i686' 'x86_64')
url="http://welcome.solutions.brother.com/bsc/public_s/id/linux/en/download_prn.html#DCP-J132W"
license=('custom')

if [ "$(uname -m)" = "x86_64" ]; then
 depends=('lib32-glibc' 'psutils')
else
 depends=('psutils')
fi
source=(http://www.brother.com/pub/bsc/linux/dlf/dcp1510lpr-3.0.1-1.i386.deb
http://download.brother.com/welcome/dlf007096/dcp1510cupswrapper-3.0.1-1.i386.deb
)
md5sums=('20aad8606e54516346348702ff137701'
         '15a01c13ef18510b5b40576505cd016e')

build() {
  srcdir="$startdir/src"
  mkdir -p "$srcdir" && cd "$srcdir"

  for i in $startdir/*.deb; do
    ar -x $i
    bsdtar xf data.tar.gz
  done
#  echo "Patching file for systemd compatibility"
#  patch $srcdir/opt/brother/Printers/dcpj132w/cupswrapper/cupswrapperdcpj132w < cupswrapper-systemd.patch
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
  cp "$srcdir/opt/brother/Printers/DCP1510/cupswrapper/brother-DCP1510-cups-en.ppd" "$pkgdir/usr/share/cups/model/Brother"
  cp "$srcdir/opt/brother/Printers/DCP1510/cupswrapper/brother-DCP1510-cups-en.ppd" "$pkgdir/usr/share/ppd/Brother"
  cp "$srcdir/opt/brother/Printers/DCP1510/cupswrapper/brother_lpdwrapper_DCP1510" "$pkgdir/usr/lib/cups/filter"
}
