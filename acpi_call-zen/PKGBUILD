# Contributor: fnord0 <fnord0 AT riseup DOT net>

pkgname=acpi_call-zen
pkgver=3.1.5
pkgrel=1
pkgdesc="zen kernel module allowing one to call parameterless ACPI methods by writing the method name to /proc/acpi/call, e.g. to turn off discrete graphics card in a dual graphics environment (like NVIDIA Optimus)"
arch=('i686' 'x86_64')
url=("http://github.com/mkottman/acpi_call")
license=('GPL')
depends=('linux-zen-headers')
install=acpi_call.install
source=('http://64.120.245.17/repo/src/acpi_call-zen.tar.gz')
md5sums=('929eedddef0c32bd23c6f7ce10f031d4')

build() {
  cd ${srcdir}


 ## Build
  cd ${srcdir}/${pkgname}

  make
}
package() {
  cd ${srcdir}/${pkgname}
  install -d ${pkgdir}/usr/share/${pkgname} || return 1
  install -d ${pkgdir}/usr/bin || return 1
  install -Dm755  ${srcdir}/${pkgname}/asus1215n.sh \
    ${pkgdir}/usr/share/${pkgname} || return 1
  install -Dm755  ${srcdir}/${pkgname}/m11xr2.sh \
    ${pkgdir}/usr/share/${pkgname} || return 1
  install -Dm755  ${srcdir}/${pkgname}/query_dsdt.pl \
    ${pkgdir}/usr/share/${pkgname} || return 1
  install -Dm755  ${srcdir}/${pkgname}/test_off.sh \
    ${pkgdir}/usr/share/${pkgname} || return 1
  ln -s /usr/share/${pkgname}/test_off.sh \
    ${pkgdir}/usr/bin/test_off.sh || return 1
  cp -R windump_hack \
    ${pkgdir}/usr/share/${pkgname}/
  install -Dm644 README \
    ${pkgdir}/usr/share/${pkgname}/README

  for _kernver in $(file /boot/* | grep "Linux kernel" | grep "zen" | sed -e 's/^.*version //g' -e 's/ .*$//g' | xargs); do
    msg2 "Building module for $_kernver..."

    # KDIR is necessary even when cleaning
    make KDIR=/usr/src/linux-${_kernver} clean
    make KDIR=/usr/src/linux-${_kernver}

    install -D -m644 acpi_call.ko ${pkgdir}/lib/modules/${_kernver}/kernel/drivers/acpi/acpi_call.ko

  done
}
