# Contributor: G_Syme <demichan(at)mail(dot)upb(dot)de>
pkgname=brother-mfc260c-cupswrapper
_printer=mfc260c
pkgver=1.0.1_1
pkgrel=2
pkgdesc="Brother LPR-to-CUPS wrapper for MFC-260C and compatible printers"
arch=('i686')
url="http://solutions.brother.com/linux/en_us/download_prn.html#MFC-260C"
license=('GPL2')
depends=("brother-${_printer}-lpr")
install=$pkgname.install
source=(http://solutions.brother.com/Library/sol/printer/linux/rpmfiles/cups_wrapper/${_printer}cupswrapper-${pkgver//_/-}.i386.deb $pkgname.patch)
md5sums=('527f8048e5dbf7034367fc612ab07776'
         'c95e97f7da579fe55ec67aa61f99aff9')

build() {
  # extract and patch deb sources
  cd $srcdir
  ar x ${_printer}cupswrapper-${pkgver//_/-}.i386.deb || return 1
  mkdir data
  tar -xvzf data.tar.gz -C data || return 1
  patch -Np0 < $pkgname.patch || return 1

  install -D -m755 $srcdir/data/usr/local/Brother/Printer/$_printer/cupswrapper/brcupsconfpt1 $pkgdir/usr/share/brother/printer/$_printer/cupswrapper/brcupsconfpt1 || return 1

  # generate ppd and filter
  $srcdir/data/usr/local/Brother/Printer/$_printer/cupswrapper/cupswrapper$_printer || return 1

  # install ppd and filter
  install -D -m755  brlpdwrapper$_printer $pkgdir/usr/lib/cups/filter/brlpdwrapper$_printer || return 1
  install -D -m664  br$_printer.ppd $pkgdir/usr/share/cups/model/br$_printer.ppd || return 1
}
