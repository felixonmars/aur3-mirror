# Contributor: Andreas Schönfelder <passtschu@freenet.de>

pkgname=brother-mfc235c
_printername=${pkgname/*-/}
pkgver=1.0.1
pkgrel=1
pkgdesc="CUPS driver for Brother MFC-235C printer"
arch=(i686 x86_64)
license=('GPL')
depends=('cups')
url="http://solutions.brother.com/linux/en_us/index.html"
source=(http://solutions.brother.com/Library/sol/printer/linux/rpmfiles/cups_wrapper/${_printername}cupswrapper-$pkgver-$pkgrel.i386.deb)
md5sums=('f3159983881cde5589bc345b553df28a')

build() {
  startdir_sed=`echo $startdir | sed 's/\//\\\\\//g'`
  ppd_file="$startdir_sed\/pkg\/usr\/share\/cups\/model\/brother\/$_printername.ppd"
  filter_file="$startdir_sed\/pkg\/usr\/lib\/cups\/filter\/brlpdwrapper$_printername"

  ar -x ${_printername}cupswrapper-$pkgver-$pkgrel.i386.deb
  tar -xf data.tar.gz

  install -d $startdir/pkg/usr/share/cups/model/brother \
             $startdir/pkg/usr/lib/cups/filter/
  sed -e "s/ppd_file_name=.*$/ppd_file_name=$ppd_file/g" -i $startdir/src/usr/local/Brother/Printer/$_printername/cupswrapper/cupswrapper$_printername
  sed -e "s/PPDC=.*$/PPDC=$ppd_file/g" -i $startdir/src/usr/local/Brother/Printer/$_printername/cupswrapper/cupswrapper$_printername
  sed -e "s/brotherlpdwrapper=.*$/brotherlpdwrapper=$filter_file/g" -i $startdir/src/usr/local/Brother/Printer/$_printername/cupswrapper/cupswrapper$_printername

  $startdir/src/usr/local/Brother/Printer/$_printername/cupswrapper/cupswrapper$_printername >/dev/null 2>/dev/null
  chmod 0755 $startdir/src/usr/local/Brother/Printer/$_printername/cupswrapper/cupswrapper$_printername
}
