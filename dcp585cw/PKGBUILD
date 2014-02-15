# Maintainer: nblock <nblock [/at\] archlinux DOT us>

pkgname=dcp585cw
_printername=${pkgname/*-/}
pkgver=1.1.2
pkgrel=10
pkgdesc="CUPS driver for Brother DCP-585CW printer"
url="http://solutions.brother.com/linux/en_us/index.html"
arch=('i686' 'x86_64')
license=('custom:Brother Industries')
depends=('cups' 'a2ps')
makedepends=('sed')
if [ "$CARCH" = "x86_64" ]; then
  optdepends=('ghostscript: Printing PostScript'
              'gsfonts: Fonts to use with GhostScript'
              'foomatic-filters: Spooler for printing PostScript'
              'lib32-libcups: use this instead of libcups if you run into problems on x86_64')
else
  optdepends=('ghostscript: Printing PostScript'
              'gsfonts: Fonts to use with GhostScript'
              'foomatic-filters: Spooler for printing PostScript')
fi
source=(http://www.brother.com/pub/bsc/linux/dlf/${_printername}cupswrapper-$pkgver-2.i386.deb
        http://www.brother.com/pub/bsc/linux/dlf/${_printername}lpr-$pkgver-2.i386.deb)
md5sums=('4d2609c24f4af8809f4aa1d4a35e471d'
         '9e7c114dbbc62ec1d4a6044953063ba6')
noextract=(${_printername}cupswrapper-$pkgver-2.i386.deb
           ${_printername}lpr-$pkgver-2.i386.deb)
install=dcp585cw.install

build() {
  cd $srcdir
  for n in *.deb; do
    ar -x "$n" data.tar.gz
    tar -xvvf data.tar.gz
    rm data.tar.gz
  done

  sed -i 's|/etc/init.d|/etc/rc.d|' $srcdir/usr/local/Brother/Printer/dcp585cw/cupswrapper/cupswrapperdcp585cw
}

package() {
  install -d "${pkgdir}/usr/local/Brother"
  install -D -m755 $srcdir/usr/bin/brprintconf_dcp585cw ${pkgdir}/usr/bin/brprintconf_dcp585cw
  cp -r $srcdir/usr/local/Brother ${pkgdir}/usr/local
}

# vim:set ts=2 sw=2 et:
