# Maintainer: onefire <onefire.myself@gmail.com>
pkgname=hack-lenovo
pkgver=20130123
pkgrel=1
pkgdesc="Without this Kernel module, Optimus techonology on Lenovo Ideapad Y580 and other laptops does not work . UPDATE: If using Linux 3.7, this package will not work, but you do not need it anyway. Rebuild your kernel with patch 86101 (see comments)." 
arch=('i686' 'x86_64')
url=("https://github.com/Bumblebee-Project/bbswitch/tree/hack-lenovo")
license=('GPL')
provides=('hack-lenovo')
conflicts=('acpi-handle-hack-lenovo')
makedepends=('linux-headers' 'git')
depends=('linux<3.7' 'linux-headers<3.7')
install=hack-lenovo.install
groups=('nvidia-cuda' 'custom')

build() {
  git clone git://github.com/Bumblebee-Project/bbswitch.git -b hack-lenovo
  cd bbswitch
  #patch the makefile so that it installs in /usr/lib instead of /lib
  sed 's/\/lib\/modules/\/usr\/lib\/modules/g' Makefile > junk && mv junk Makefile
  make 
  make modname=acpi-handle-hack
  }

package() {
  _kernver=`uname -r | head -c 3`
  cd $srcdir/bbswitch
  mkdir -p $pkgdir/usr/src/acpi-handle-hack-"${pkgver}" 
  install -m 644 {Makefile,acpi-handle-hack.c} $pkgdir/usr/src/acpi-handle-hack-"${pkgver}"
  install -m 644 dkms/{acpi-handle-hack.conf,dkms.conf} $pkgdir/usr/src/acpi-handle-hack-"${pkgver}"
  install -Dm 755 acpi-handle-hack.ko $pkgdir/usr/lib/modules/extramodules-$_kernver-ARCH/acpi-handle-hack.ko
}


