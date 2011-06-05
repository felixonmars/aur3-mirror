#based on starfish's updated PKGBUILD and Ubuntu Documentation (https://help.ubuntu.com/community/DialupModemHowto/Conexant)

pkgname=hsfmodem-utils-dell
pkgver=7.80.02.06full
pkgrel=1
pkgdesc="Linux drivers for the Conexant HSF Softmodem family (userspace tools and libraries), with Dell binaries"
arch=('i686' 'x86_64')
url="http://www.linuxant.com/drivers/hsf/"
license=('GPL' 'custom')
depends=('cpio')
backup=('etc/hsfmodem/nvm/dynamic')
install=hsfmodem-utils.install
options=(!emptydirs)

case "$CARCH" in
  i686)
      source=(http://www.linuxant.com/drivers/hsf/full/archive/hsfmodem-${pkgver}/hsfmodem-${pkgver}.tar.gz
              http://linux.dell.com/files/ubuntu/hardy/modem-drivers/hsf/hsfmodem-7.68.00.09oem.tar.gz)
      md5sums=('8eb0935e86b898190bf20c08894af17e'
               '71bccfcb8caed31b91e605889e94bcc9')
      ;;
  x86_64)
      source=(http://www.linuxant.com/drivers/hsf/full/archive/hsfmodem-${pkgver%full}${CARCH}full/hsfmodem-${pkgver%full}${CARCH}full.tar.gz
              http://linux.dell.com/files/ubuntu/hardy/modem-drivers/hsf/hsfmodem-7.68.00.09x86_64oem.tar.gz)
      md5sums=('74df1a0af818a918a68b38bf9a01599b'
               '9cfa801c88f9c61cb26db786d64872c7')
      ;;
esac

build() {
  cd $srcdir/hsfmodem-${pkgver%full}*full/

  rm -r modules/imported
  cp -R $srcdir/hsfmodem-7.68.00.09x86_64oem/modules/imported ./modules/

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
