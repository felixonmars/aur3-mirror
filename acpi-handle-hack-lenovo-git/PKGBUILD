# Contributor: Cyril Lashkevich <notorca at gmail dot com>

pkgname=acpi-handle-hack-lenovo-git
pkgver=20120715
pkgrel=1
pkgdesc="kernel module allowing to workaround kernel bug 42696 on Lenovo Ideapad Y470/Y570 and Toshiba Satellite P870"
arch=('i686' 'x86_64')
url=("http://github.com/Bumblebee-Project/bbswitch")
license=('GPL')
provides=('acpi-handle-hack-lenovo')
conflicts=('acpi-handle-hack-lenovo')
makedepends=('linux-headers' 'git')
install=acpi-handle-hack-lenovo.install
_gitroot=('git://github.com/Bumblebee-Project/bbswitch.git')
_gitname=("bbswitch")

build() {
  cd ${srcdir}

 ## Git checkout
  if [ -d ${srcdir}/${_gitname} ] ; then
    msg "Git checkout:  Updating existing tree"
    cd ${_gitname} && git pull origin
    msg "Git checkout:  Tree has been updated"
  else
    msg "Git checkout:  Retrieving sources"
    git clone ${_gitroot} -b hack-lenovo 
  fi
  msg "Checkout completed"

  cd ${srcdir}/${_gitname}
}

package() {
  cd ${srcdir}/${_gitname}
  for _kernver in $(file /boot/* | grep "Linux kernel" | sed -e 's/^.*version //g' -e 's/ .*$//g' | xargs); do
    msg2 "Building module for $_kernver..."

    # KDIR is necessary even when cleaning
    make KDIR=/usr/src/linux-${_kernver} clean
    make KDIR=/usr/src/linux-${_kernver} modname=acpi-handle-hack
    install -D -m644 acpi-handle-hack.ko ${pkgdir}/usr/lib/modules/${_kernver}/kernel/drivers/acpi/acpi-handle-hack.ko
  done
}
