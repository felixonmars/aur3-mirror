pkgname=kernel26-usermode
_basekernel=2.6.39
pkgver=2.6.39.3
pkgrel=1
_kernelname=-usermodelinux
pkgdesc="User mode Linux kernel and modules"
arch=(i686 x86_64)
license=('GPL2')
url="http://user-mode-linux.sourceforge.net/"
depends=('coreutils')
source=(ftp://ftp.kernel.org/pub/linux/kernel/v2.6/linux-$pkgver.tar.bz2)
md5sums=('5afede829846587e798f2631c2ece84f')

build() {
  cd ${srcdir}/linux-$pkgver

  mkdir -p $pkgdir/usr/bin $pkgdir/usr/share/kernel26-usermode

  make ARCH=um defconfig || return 1

  if [ "${_kernelname}" != "" ]; then
    sed -i "s|CONFIG_LOCALVERSION=.*|CONFIG_LOCALVERSION=\"${_kernelname}\"|g" ./.config
    sed -i "s|CONFIG_LOCALVERSION_AUTO=.*|CONFIG_LOCALVERSION_AUTO=n|g" ./.config
  fi

  LDFLAGS="" make ARCH=um vmlinux modules || return 1
  LDFLAGS="" make ARCH=um INSTALL_MOD_PATH=${pkgdir}/usr modules_install || return 1

  cp System.map ${pkgdir}/usr/share/kernel26-usermode/System.map && \
  cp vmlinux ${pkgdir}/usr/bin/ && \
  rm -f $pkgdir/usr/lib/modules/${_basekernel}/{source,build}
}
