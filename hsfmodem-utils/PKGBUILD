# $Id: PKGBUILD 64 2008-11-13 05:49:10Z djclue917 $
# Maintainer: Darwin Bautista <djclue917@gmail.com>
# Contributor: Darwin Bautista <djclue917@gmail.com>

pkgname=hsfmodem-utils
pkgver=7.68.00.14full
pkgrel=1
pkgdesc="Linux drivers for the Conexant HSF Softmodem family (userspace tools and libraries)"
arch=('i686' 'x86_64')
url="http://www.linuxant.com/drivers/hsf/"
license=('GPL' 'custom')
backup=('etc/hsfmodem/nvm/dynamic')
install=hsfmodem-utils.install
options=(!emptydirs)
source=(http://www.linuxant.com/drivers/hsf/full/archive/hsfmodem-$pkgver/hsfmodem-$pkgver.tar.gz)
[ "$CARCH" = "x86_64" ] && source[0]=http://www.linuxant.com/drivers/hsf/full/archive/hsfmodem-${pkgver%full}x86_64full/hsfmodem-${pkgver%full}x86_64full.tar.gz
md5sums=('8f0752c3ed5d08524399da7cc600b6e4')
[ "$CARCH" = "x86_64" ] && md5sums[0]='85b179c3f2fd8dbf25d096f026ca22fa'

build() {
  cd $srcdir/hsfmodem-${pkgver%full}*full/

  make ROOT=$pkgdir install || return 1

  echo "TAR hsfmodem-$pkgver" > $pkgdir/etc/hsfmodem/package

  # Fix paths in scripts
  sed -e "s|$pkgdir/usr/sbin:||" -e "s|$pkgdir||g" -i $pkgdir/usr/sbin/hsf{config,dcpd}

  rm -R $pkgdir/etc/hsfmodem/nvm/hsfpcibasic2hsfi/Region
  ln -s ../hsfpcibasic2/Region $pkgdir/etc/hsfmodem/nvm/hsfpcibasic2hsfi/

  # Install license for non-GPL'ed components
  install -D -m644 LICENSE $pkgdir/usr/share/licenses/$pkgname/license.txt

  rm $pkgdir/usr/lib/hsfmodem/{config.mak,LICENSE}
  rm $pkgdir/usr/lib/hsfmodem/modules/Makefile
  rm $pkgdir/usr/lib/hsfmodem/modules/GPL/{COPYING,hda/Makefile}
}

# vim:set ts=2 sw=2 et:
