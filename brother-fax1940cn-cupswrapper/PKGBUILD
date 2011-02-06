# Contributor: Markus Golser <elmargol@googlemail.com>
pkgname=brother-fax1940cn-cupswrapper
_printer=FAX1940CN
pkgver=1.0.2_3
pkgrel=2
pkgdesc="Brother LPR-to-CUPS wrapper for fax1940cn and compatible printers"
arch=('i686')
url="http://solutions.brother.com/linux/en_us/download_prn.html#MFC-260C"
license=('GPL2')
depends=("brother-fax1940cn-lpr" tcsh)
source=(http://solutions.brother.com/Library/sol/printer/linux/rpmfiles/cups_wrapper/cupswrapper${_printer}-${pkgver//_/-}.i386.deb $pkgname.patch)
md5sums=('2ecba194051aa6494b40f9523b0ecf5b'
         '27c6df7057bd59ffcf73c61dbef66850')

build() {
  # extract and patch deb sources
  cd $srcdir
  ar x cupswrapper${_printer}-${pkgver//_/-}.i386.deb || return 1
  mkdir data
  tar -xvzf data.tar.gz -C data || return 1
  patch -Np1 -d data/ < $pkgname.patch || return 1

  install -D -m755 $srcdir/data/usr/local/Brother/cupswrapper/cupswrapperFAX1940CN-1.0.2 $pkgdir/usr/Brother/cupswrapper/cupswrapperFAX1940CN-1.0.2 || return 1

  # generate ppd and filter
  $srcdir/data/usr/local/Brother/cupswrapper/cupswrapperFAX1940CN-1.0.2 || return 1

  #install ppd and filter
 install -D -m755 $srcdir/brlpdwrapperFAX1940CN $pkgdir/usr/lib/cups/filter/brlpdwrapperFAX1940CN  || return 1
 install -D -m664 $srcdir/brfax1940cn_cups.ppd $pkgdir/usr/share/cups/model/brfax1940cn_cups.ppd  || return 1

}
