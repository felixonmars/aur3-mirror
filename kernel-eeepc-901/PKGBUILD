# vim:set ts=2 sw=2 et:                                                         
# Maintainer: Dan McGee <dan@archlinux.org>
# Maintainer: Smith Dhumbumroong <zodmaner@gmail.com>

pkgname=kernel-eeepc-901
pkgver=3.2.7
_kernver=3.2
pkgrel=1
pkgdesc="The Linux Kernel and modules for the Asus Eee PC 901"
arch=('i686')
license=('GPL2')
url="http://bitbucket.org/zodmaner/eeepc-901/wiki/Home"
groups=(eeepc-901)
depends=('coreutils' 'module-init-tools' 'linux-firmware')
optdepends=('crda: for wireless regulatory domain support'
            'iw: for wireless configuration support')
replaces=('kernel-eeepc-901-kms')
install=kernel-eeepc-901.install
source=(ftp://ftp.kernel.org/pub/linux/kernel/v3.0/linux-$_kernver.tar.bz2
        ftp://ftp.kernel.org/pub/linux/kernel/v3.0/patch-$pkgver.gz
        kernelconfig
        61-eee-ssd.rules
        CREDITS)

build() {
  # unset since our build machine may differ from eee
  unset CFLAGS CXXFLAGS

  # get into the linux source directory and start some magic
  cd $srcdir/linux-$_kernver

  if [ "$_kernver" != "$pkgver" ]; then
    # add latest kernel stable patch
    patch -Np1 < ../patch-$pkgver || return 1
  fi

  # load configuration and build kernel + modules
  cp ../kernelconfig ./.config
  make menuconfig
  #make menuconfig
  make || return 1
}

package() {
  # install our modules
  cd $srcdir/linux-$_kernver
  mkdir -p $pkgdir/{lib/modules,boot}
  make INSTALL_MOD_PATH=$pkgdir modules_install || return 1

  # remove the junk symlinks
  cd $srcdir/linux-$_kernver
  if [ "$_kernver" != "$pkgver" ]; then
    rm $pkgdir/lib/modules/${pkgver}-eeepc-901/{build,source}
  else
    rm $pkgdir/lib/modules/${pkgver}.0-eeepc-901/{build,source}
  fi
  # install the kernel
  cp arch/x86/boot/bzImage $pkgdir/boot/vmlinuz-eeepc-901
  # install a helper file for all install scripts
  mkdir -p $pkgdir/usr/share/kernel-eeepc-901/
  if [ "$_kernver" != "$pkgver" ]; then
    echo "KERNEL_VERSION='${pkgver}-eeepc-901'" > \
    $pkgdir/usr/share/kernel-eeepc-901/currver
  else
    echo "KERNEL_VERSION='${pkgver}.0-eeepc-901'" > \
    $pkgdir/usr/share/kernel-eeepc-901/currver
  fi

  # udev rules for SSD drives
  mkdir -p $pkgdir/lib/udev/rules.d/
  install -m644 $srcdir/61-eee-ssd.rules $pkgdir/lib/udev/rules.d/

  # install credits file
  install -m644 $srcdir/CREDITS $pkgdir/usr/share/kernel-eeepc-901/CREDITS
}

md5sums=('7ceb61f87c097fc17509844b71268935'
         '665fccb96dd17e8e1ecec81ee7f85592'
         'e709765d4bdef9595c2a9ed67cdd2b30'
         '73a20e8bf2bb29ba342f43460c6291cb'
         'bccc9e60b27d739d0d4383dc9c08ed4a')
