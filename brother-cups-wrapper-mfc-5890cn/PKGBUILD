# Maintainer: Holgersson <tucxholg@yahoo.de>
# Contributor: Holgersson <tucxholg@yahoo.de>
pkgname=brother-cups-wrapper-mfc-5890cn
pkgver=1.1.2
pkgrel=3
pkgdesc="Contains code for printing functions of MFC-5890CN"
arch=('i686' 'x86_64')
url="http://brother.com"
license=('GPL' 'custom:brother commercial license')
depends=('cups' 'brother-lpr-mfc-5890cn' 'tcsh' )
if [ $(uname -m) == x86_64 ]; then
  depends=('cups' 'brother-lpr-mfc-5890cn' 'tcsh' 'lib32-libcups')
fi
install=$pkgname.install
source=('http://www.brother.com/pub/bsc/linux/dlf/mfc5890cncupswrapper-1.1.2-2.i386.deb')
md5sums=('bda3b957b21df9e4510c45523de08361')

build() {
  # extract the deb archive
  cd $srcdir
  ar x mfc5890cncupswrapper-1.1.2-2.i386.deb || return 1
  mkdir data
  tar -xvzf data.tar.gz -C data || return 1

  # create directory
  install -d -m755 $pkgdir/usr/local/Brother/Printer/mfc5890cn/cupswrapper || return 1

  # copy the rest
  cp -Rp data/usr/local/Brother/Printer/mfc5890cn/cupswrapper $pkgdir/usr/local/Brother/Printer/mfc5890cn/ || return 1
}
