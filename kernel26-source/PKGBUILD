# Maintainer: Thomas Dziedzic < gostrc at gmail >
# Contributor: Schnouki <thomas.jost@gmail.com>
# Contributor: Emmanuel GRAS <gras.emmanuel@gmail.com>
 
pkgname=kernel26-source
# pkgname=kernel26-custom       # Build kernel with a different name
_basekernel=2.6.39
pkgver=${_basekernel}.3
pkgrel=1
pkgdesc="The Linux Kernel and modules source code."
_patchname="patch-${pkgver}-${pkgrel}-ARCH"
#_patchname="patch-${pkgver}-1-ARCH"
arch=(i686 x86_64)
license=('GPL2')
url="http://www.kernel.org"
depends=("coreutils")
options=(!strip)
source=(ftp://ftp.kernel.org/pub/linux/kernel/v2.6/linux-$_basekernel.tar.bz2
        ftp://ftp.archlinux.org/other/kernel26/${_patchname}.bz2
        # the main kernel config files
        config config.x86_64
        # standard config files for mkinitcpio ramdisk
        kernel26.preset)
md5sums=('1aab7a741abe08d42e8eccf20de61e05'
         'b23d7def30e57242cfe088f4d8ca8baa'
         'de7cf2c54104b88e3385683f47fedaef'
         '8be1f60e54eb505b7e67d39fd2233103'
         '25584700a0a679542929c4bed31433b6')

build() {
  cd ${srcdir}/linux-$_basekernel
  # Add -ARCH patches
  # See http://projects.archlinux.org/linux-2.6-ARCH.git/
  patch -Np1 -i ${srcdir}/${_patchname}

  if [ "$CARCH" = "x86_64" ]; then
    cat ../config.x86_64 >./.config
  else
    cat ../config >./.config
  fi
  if [ "${_kernelname}" != "" ]; then
    sed -i "s|CONFIG_LOCALVERSION=.*|CONFIG_LOCALVERSION=\"${_kernelname}\"|g" ./.config
  fi
  # get kernel version  
  make prepare
  # load configuration
  # Configure the kernel. Replace the line below with one of your choice.
  #make menuconfig # CLI menu for configuration
  #make nconfig # new CLI menu for configuration
  #make xconfig # X-based configuration
  #make oldconfig # using old config from previous kernel version
  # ... or manually edit .config
  ####################
  # stop here
  # this is useful to configure the kernel
  #msg "Stopping build"
  #return 1
  ####################
  yes "" | make config

  # Keep the source code
  mkdir -p $pkgdir/usr/src
  mv $srcdir/linux-$_basekernel $pkgdir/usr/src/linux-$_basekernel

  # Add link from the modules directory
  mkdir -p $pkgdir/lib/modules/$_kernver
  cd $pkgdir/lib/modules/$_kernver
  ln -s ../../../usr/src/linux-$_basekernel source
}
