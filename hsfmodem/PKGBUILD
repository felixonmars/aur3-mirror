# $Id: PKGBUILD 65 2008-11-13 05:49:31Z djclue917 $
# Maintainer: Darwin Bautista <djclue917@gmail.com>
# Contributor: Darwin Bautista <djclue917@gmail.com>

pkgname=hsfmodem
pkgver=7.68.00.14full
pkgrel=1
pkgdesc="Linux drivers for the Conexant HSF Softmodem family (kernel modules)"
arch=('i686' 'x86_64')
url="http://www.linuxant.com/drivers/hsf/"
license=('GPL' 'custom')
depends=("hsfmodem-utils>=$pkgver" 'kernel26')
install=hsfmodem.install
source=(http://www.linuxant.com/drivers/hsf/full/archive/hsfmodem-$pkgver/hsfmodem-$pkgver.tar.gz)
[ "$CARCH" = "x86_64" ] && source[0]=http://www.linuxant.com/drivers/hsf/full/archive/hsfmodem-${pkgver%full}x86_64full/hsfmodem-${pkgver%full}x86_64full.tar.gz
md5sums=('8f0752c3ed5d08524399da7cc600b6e4')
[ "$CARCH" = "x86_64" ] && md5sums[0]='85b179c3f2fd8dbf25d096f026ca22fa'

build() {
  cd $srcdir/hsfmodem-${pkgver%full}*full/modules/

  make CNXT_MODS_DIR=$pkgdir/lib/modules/$(uname -r)/extra modules_install || return 1
  make CNXTLIBDIR=$pkgdir/usr/lib/hsfmodem CNXT_MODS_DIR=$pkgdir/lib/modules/$(uname -r)/extra modules_install
}

# vim:set ts=2 sw=2 et:
