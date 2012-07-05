
# Mantainer: M0Rf39
# Contributor: Charles Lindsay <charles@chaoslizard.org>

pkgname=vhba-module-all
pkgver=20120422
pkgrel=1
pkgdesc="Kernel module that emulates SCSI devices (builded for all kernels)"
arch=('i686' 'x86_64')
url="http://cdemu.sourceforge.net/"
license=('GPL2')
depends=('linux')
makedepends=('linux-headers')
provides=('vhba-module')
conflicts=('vhba-module')
install=vhba-module.install
source=("http://downloads.sourceforge.net/cdemu/vhba-module-$pkgver.tar.bz2"
	'60-vhba.rules')

	USE_PACMAN_VERSION=0
_compress=y
  
  if [ "$USE_PACMAN_VERSION" = "0" ]; then
    _KERNELS=`file /boot/* | grep 'Linux kernel.*boot executable' | sed 's/.*version \([^ ]\+\).*/\1/'`
  else
    _PACKAGES=`pacman -Qsq linux`
    _KERNELS=`pacman -Ql $_PACKAGES | grep /modules.alias.bin | sed 's/.*\/lib\/modules\/\(.*\)\/modules.alias.bin/\1/g'`
  fi

_EXTERNALS=()
for ext in `pacman -Ql $(pacman -Qsq linux | grep linux) | grep -e '/lib/modules/extramodules.*/$' | sed 's/.*\/lib\/modules\/extramodules-\(.*\)\//\1/g'`;do
  _EXTERNALS+=("${ext}" );
done

_NUMKERNELS=${#_KERNELS[@]}

build() {
  cd "$srcdir/vhba-module-$pkgver"
  
  msg "Found $_NUMKERNELS kernels"
    
    # Loop through all detected kernels and build modules
    for ((index=0;index<$_NUMKERNELS;index++)); do
        _kernver=${_KERNELS[${index}]}
        mkdir "kernel-${_kernver}"
        msg "Working on the kernel: $_kernver"
        msg2 "Building module..."
        make -j1 KDIR=/usr/src/linux-$_kernver
        mv vhba.ko "kernel-${_kernver}"
    done
}

package() {
  cd "$srcdir/vhba-module-$pkgver"

  for ((index=0;index<$_NUMKERNELS;index++)); do
        _kernver=${_KERNELS[${index}]}
        _extmodul=${_EXTERNALS[${index}]}
        if [ $_compress = "y" ]; then
            msg2 "Compressing module with gzip..."
            gzip -9 kernel-${_kernver}/vhba.ko
            _modname="vhba.ko.gz"
        fi
        msg2 "Installing module..."
        install -D -m644 kernel-${_kernver}/$_modname \
        ${pkgdir}/lib/modules/extramodules-${_extmodul}/$_modname
    done

  install -Dm644 "$srcdir/60-vhba.rules" \
	  "$pkgdir/usr/lib/udev/rules.d/60-vhba.rules"
}
md5sums=('d97372da1d270d1605742b2995fb6678'
         'b5e82d0160e7a181219b67c1794d5c27')
