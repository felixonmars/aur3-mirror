# Maintainer: Morten Hersson <mhersson at gmail dot com>

pkgname=vmware-server-modules
pkgver=2.0.2
pkgrel=4
pkgdesc="Kernel modules for VMware Server"
arch=('i686' 'x86_64')
url="http://www.vmware.com/products/server/"
license=('custom')
depends=('kernel26>=2.6.32')
makedepends=('kernel26-headers')
conflicts=('vmware-workstation-modules' 'vmware-player-modules')
install=vmware-server-modules.install

_kernver=`uname -r`

source=(VMware-server-2.0.2-203138-update-2.patch vmware-server-modules-autoconf.patch vmware-server-modules-vsock-kernel2.6.35.patch vmware-server-modules-vmmon-kernel2.6.36.patch)


md5sums=('774a6361a443834205bc0172498bb2c0'
         '91ea48c3d4779f531cb942be09248dba'
         '3325f1b34eb21ee7d4cceb5f0da852f1'
         'bfd62533e023b696cf7ff45379732b71')


case ${CARCH} in
  i686)
    source=(${source[@]} 'VMware-server-2.0.2-203138.i386.tar.gz')
    md5sums=(${md5sums[@]} '6eb844d1ab4aed6128438e5f587d10bb');;
  x86_64)
    source=(${source[@]} 'VMware-server-2.0.2-203138.x86_64.tar.gz')
    md5sums=(${md5sums[@]} 'cc7aef813008eeb7150c21547d431b39');;
esac

build() {
  cd "$srcdir/vmware-server-distrib/lib/modules/source"

  for module in *.tar; do
    tar xf $module
  done

  cd "$srcdir/vmware-server-distrib"

  # patch
  patch -p1 < ../VMware-server-2.0.2-203138-update-2.patch
  patch -p2 < ../vmware-server-modules-autoconf.patch

  if [[ ${_kernver:0:6} == "2.6.35" ]]; then
  	patch -p1 < ../vmware-server-modules-vsock-kernel2.6.35.patch
  fi

  if [[ ${_kernver:0:6} == "2.6.36" ]]; then
  	patch -p1 < ../vmware-server-modules-vsock-kernel2.6.35.patch
  	patch -p1 < ../vmware-server-modules-vmmon-kernel2.6.36.patch
  fi

  cd "$srcdir/vmware-server-distrib/lib/modules/source"

  for module in vmci vsock vmmon vmnet; do
    make -C $module-only HEADER_DIR=/lib/modules/$_kernver/build/include || \
      return 1
    install -D -m644 $module-only/$module.ko \
      "$pkgdir/lib/modules/$_kernver/misc/$module.ko"
  done 

  # License
  install -D -m644 "$srcdir/vmware-server-distrib/doc/EULA" \
    "$pkgdir/usr/share/licenses/vmware-server-modules/EULA"
  install -D -m644 "$srcdir/vmware-server-distrib/doc/open_source_licenses.txt" \
    "$pkgdir/usr/share/licenses/vmware-server-modules/open_source_licenses.txt"

  sed -i -e "s|KERNEL_VERSION='.*'|KERNEL_VERSION='$_kernver'|" \
    "$startdir/vmware-server-modules.install"
}
