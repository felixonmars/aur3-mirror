# Maintainer: Holgersson <tucxholg@yahoo.de>
# Contributor: Holgersson <tucxholg@yahoo.de>
pkgname=brother-lpr-mfc-5890cn
pkgver=1.1.2
pkgrel=3
pkgdesc='Contains code for printing functions of MFC-5890CN. LPR-Driver."'
arch=('i686' 'x86_64')
url="http://brother.com"
license=('GPL' 'custom:brother commercial license')
depends=('cups')
install=$pkgname.install
source=('http://www.brother.com/pub/bsc/linux/dlf/mfc5890cnlpr-1.1.2-2.i386.deb')
md5sums=('2ed865ca0f157c000dcbff1e2bf7b8db')

build() {
  # extract the deb archive
  cd $srcdir
  ar x mfc5890cnlpr-1.1.2-2.i386.deb || return 1
  mkdir data
  tar -xvzf data.tar.gz -C data || return 1

  # create directories
  install -d -m755 $pkgdir/usr/bin || return 1
  install -d -m755 $pkgdir/usr/local/Brother/Printer/mfc5890cn/{inf,lpd} || return 1

  #install the config tool
  install -m755 data/usr/bin/brprintconf_mfc5890cn $pkgdir/usr/bin/ || return 1

  # copy the rest
  cp -Rp data/usr/local/Brother/Printer/mfc5890cn/{inf,lpd} $pkgdir/usr/local/Brother/Printer/mfc5890cn || return 1
}
