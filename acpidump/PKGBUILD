# Maintainer: Peter Wu <lekensteyn@gmail.com>
pkgname=acpidump
# commit from which the source files were taken
_commit=4084a9b
pkgver=20101221_${_commit}
pkgrel=1
pkgdesc="Dump system's ACPI tables to an ASCII file."
arch=(i686 x86_64)
url="http://www.kernel.org/"
license=('GPL')
depends=(glibc)
makedepends=(linux-headers)
options=()
source=("acpidump.c" "acpidump.8")
md5sums=('10c05760e236e5349e70e56b76e405d0'
         'd053a653a8907302610d53651b1d8a65')

build() {
  cd "$srcdir"
  CFLAGS+=" -DDEFINE_ALTERNATE_TYPES"
  _kernver=$(uname -r)
  CFLAGS+=" -I/usr/lib/modules/${_kernver}/build/include"
  cc $CFLAGS acpidump.c -o acpidump
}

package() {
  cd "$srcdir"
  install -D -m755 acpidump "${pkgdir}/usr/bin/acpidump"
  install -D -m644 acpidump.8 "${pkgdir}/usr/share/man/man8/acpidump.8"
}

# vim:set ts=2 sw=2 et:
