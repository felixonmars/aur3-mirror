# Contributor: Suminus <suminus(at)riseup.net>

_printer=mfc795cw
pkgname=brother-${_printer}-cupswrapper
pkgver=1.1.2_2
_version="${pkgver//_/-}"
pkgrel=2
pkgdesc="LPR-to-CUPS wrapper for Brother MFC-795CW multifunction network printer"
arch=('i686' 'x86_64')
url="http://welcome.solutions.brother.com/bsc/public_s/id/linux/en/download_prn.html#MFC-795CW"
license=('GPL')
depends=('cups' 'ghostscript' "brother-${_printer}-lpr>=1.1.2_1-1")
install="$pkgname.install"
source=("http://www.brother.com/pub/bsc/linux/dlf/mfc795cwcupswrapper-1.1.2-2.i386.deb")
md5sums=('22371a40d661afcb80d00297620d9e41')

build() {
  cd $srcdir

  ar x ${_printer}cupswrapper-${_version}.i386.deb || return 1
  [ ! -d "data" ] &&  mkdir data
  tar -xzvf data.tar.gz -C data || return 1

  [ ! -d "data/usr/share" ] && mkdir data/usr/share
  mv data/usr/local/Brother data/usr/share/brother
  rm -r data/usr/local
  sed -i 's|/usr/local/Brother|/usr/share/brother|g' `grep -lr '/usr/local/Brother' data/` || return 1
  sed -i 's|/etc/init.d|/etc/rc.d|' `grep -lr '/etc/init.d' data/` || return 1

  cp -r data/usr $pkgdir || return 1
}
