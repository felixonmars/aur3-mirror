# Maintainer: Dan McGee <dan@archlinux.org>
# Maintainer: Aliaksandr Stelmachonak <mail.avatar@gmail.com>

pkgname=kernel-eee-lts
_kernver=2.6.32
pkgver=${_kernver}.28
pkgrel=1
pkgdesc="The LTS Linux Kernel and modules for the Asus Eee PC 701/900 based on toofishes kernel config"
arch=('i686')
license=('GPL2')
url="http://www.kernel.org"
groups=(eee)
depends=('coreutils' 'module-init-tools')
optdepends=('crda: for wireless regulatory domain support'
            'iw: for wireless configuration support')
replaces=('linux-uvc-eee-svn' 'madwifi-eee-svn')
conflicts=('kernel-eee')
provides=('kernel26-lts')
install=kernel-eee-lts.install
source=(
	ftp://ftp.kernel.org/pub/linux/kernel/v2.6/longterm/v2.6.32/linux-$_kernver.tar.bz2
	ftp://ftp.kernel.org/pub/linux/kernel/v2.6/longterm/v2.6.32/patch-$pkgver.bz2
	61-eee-ssd.rules
	kernelconfig
)
_patches=()
source=(${source[@]} ${_patches[@]})

build() {
  # unset since our build machine may differ from eee
  unset CFLAGS CXXFLAGS

  # get into the linux source directory and start some magic
  cd $srcdir/linux-$_kernver

  if [ "$_kernver" != "$pkgver" ]; then
    # add latest kernel stable patch
    patch -Np1 < ../patch-$pkgver || return 1
  fi

  # patch time!
  for p in "${_patches[@]}"; do
    patch -Np1 < ../$p || return 1
  done

  # load configuration and build kernel + modules
  cp ../kernelconfig ./.config
  make silentoldconfig
  make || return 1
}

package() {
  # install our modules
  cd $srcdir/linux-$_kernver
  mkdir -p $pkgdir/{lib/modules,boot}
  make INSTALL_MOD_PATH=$pkgdir modules_install || return 1

  # remove the junk symlinks
  cd $srcdir/linux-$_kernver
  rm $pkgdir/lib/modules/${pkgver}eee/{build,source}
  
  # install the kernel
  cp System.map $pkgdir/boot/System.map.eee
  cp arch/x86/boot/bzImage $pkgdir/boot/vmlinuzeee
  
  # install a helper file for all install scripts
  mkdir -p $pkgdir/usr/share/kernel-eee/
  echo "KERNEL_VERSION='${pkgver}eee'" > $pkgdir/usr/share/kernel-eee/currver

  # udev rules for SSD drives
  mkdir -p $pkgdir/lib/udev/rules.d/
  install -m644 $srcdir/61-eee-ssd.rules $pkgdir/lib/udev/rules.d/
}

md5sums=('260551284ac224c3a43c4adac7df4879'
         'fc8c36b4638d8384a5d26a50413a1d11'
         'dcf20bf472ab48210bbbf09a67ca3b17'
         '3f017a506cd82c5fcf3bc57f8b05cc8c')
