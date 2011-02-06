# Contributor: fnord0 <fnord0 AT riseup DOT net>

pkgname=acpi_call-git
pkgver=20101223
pkgrel=1
pkgdesc="kernel module allowing one to call parameterless ACPI methods by writing the method name to /proc/acpi/call, e.g. to turn off discrete graphics card in a dual graphics environment (like NVIDIA Optimus)"
arch=('i686' 'x86_64')
url=("http://github.com/mkottman/acpi_call")
license=('GPL')
provides=('acpi_call')
makedepends=('git')
optdepends=('kernel26-headers: needed if using ARCH provided kernel')
install=acpi_call.install
_gitroot=("http://github.com/mkottman/acpi_call.git")
_gitname=("acpi_call")

build() {
  cd ${srcdir}

 ## Git checkout
  if [ -d ${srcdir}/${_gitname} ] ; then
    msg "Git checkout:  Updating existing tree"
    cd ${_gitname} && git pull origin
    msg "Git checkout:  Tree has been updated"
  else
    msg "Git checkout:  Retrieving sources"
    git clone ${_gitroot}
  fi
  msg "Checkout completed"

 ## Build
  rm -rf ${srcdir}/${_gitname}-build
  cp -r ${srcdir}/${_gitname} ${srcdir}/${_gitname}-build
  cd ${srcdir}/${_gitname}-build

  make
}
package() {
  cd ${srcdir}/${_gitname}-build
  install -d ${pkgdir}/usr/share/${_gitname} || return 1
  install -d ${pkgdir}/usr/bin || return 1
  install -d ${pkgdir}/usr/share/${_gitname}/doc || return 1
  cp -a  ${srcdir}/${_gitname}-build/test_off.sh \
    ${pkgdir}/usr/share/${_gitname} || return 1
  ln -s /usr/share/${_gitname}/test_off.sh \
    ${pkgdir}/usr/bin/test_off.sh || return 1
  install -Dm644 README \
    ${pkgdir}/usr/share/${_gitname}/README

  for _kernver in $(file /boot/* | sed -n '/Linux kernel/s/.* version \(2\.6\.[-[:alnum:]_]\+\).*/\1/p'); do
    msg2 "Building module for $_kernver..."

    # KDIR is necessary even when cleaning
    make KDIR=/usr/src/linux-${_kernver} clean
    make KDIR=/usr/src/linux-${_kernver}

    install -D -m644 acpi_call.ko ${pkgdir}/lib/modules/${_kernver}/kernel/drivers/acpi/acpi_call.ko

  done
}
