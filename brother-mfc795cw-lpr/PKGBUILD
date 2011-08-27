# Contributor: Suminus <suminus(at)riseup.net>

_printer=mfc795cw
pkgname=brother-${_printer}-lpr
pkgver=1.1.2_1
_version=${pkgver//_/-}
pkgrel=1
pkgdesc="LPR driver for Brother MFC-795CW multifunction network printer"
arch=('i686' 'x86_64')
url="http://welcome.solutions.brother.com/bsc/public_s/id/linux/en/download_prn.html#MFC-795CW"
license=('GPL')
depends=('tcsh')
source=("http://www.brother.com/pub/bsc/linux/dlf/mfc795cwlpr-1.1.2-1.i386.deb")
md5sums=('278867cf96f0d7f8ec86740c1996709a')

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
