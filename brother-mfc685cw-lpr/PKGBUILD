# Maintainer: Roland Singer <roland@manjaro.org>

_printer=mfc685cw
pkgname=brother-${_printer}-lpr
pkgver=1.0.1_1
_version="${pkgver//_/-}"
pkgrel=1
pkgdesc="LPR driver for Brother MFC-685CW"
arch=('i686' 'x86_64')
url="http://welcome.solutions.brother.com/bsc/public_s/id/linux/en/download_prn.html#MFC-685CW"
license=('GPL')
depends=('tcsh')
source=("http://pub.brother.com/pub/com/bsc/linux/dlf/${_printer}lpr-${_version}.i386.deb")
md5sums=('c89c29d67384368389fb5ccfab021a09')

build() {
  cd $srcdir

  ar x ${_printer}lpr-${_version}.i386.deb || return 1
  [ ! -d "data" ] &&  mkdir data
  tar -xzvf data.tar.gz -C data || return 1

  [ ! -d "data/usr/share" ] && mkdir data/usr/share
  mv data/usr/local/Brother data/usr/share/brother
  rm -r data/usr/local
  sed -i 's|/usr/local/Brother|/usr/share/brother|g' `grep -lr '/usr/local/Brother' data/` || return 1

  cp -r data/usr $pkgdir || return 1
}
