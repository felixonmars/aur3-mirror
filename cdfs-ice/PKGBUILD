# Maintainer: cantabile <cantabile dot desu at gmail dot com>
# Contributor (from 'cdfs'): J. Santiago Hirschfeld <jsantiagoh@yahoo.com.ar>
# based on 'cdfs' in [community]

_appname='cdfs'
_suffix='-ice'
_kernver_one='2.6.35'
_kernver_two='2.6.36'
_kernver=${_kernver_one}${_suffix}

pkgname=${_appname}${_suffix}
pkgver=2.6.27
pkgrel=2
pkgdesc="File system module that 'exports' all tracks and boot images \
         on a CD as normal files. For use with kernel26${_suffix}"
arch=('i686' 'x86_64')
url="http://www.elis.UGent.be/~ronsse/cdfs/"
license=('GPL')
install=${_appname}.install
depends=("kernel26${_suffix}>=${_kernver_one}" "kernel26${_suffix}<${_kernver_two}")
makedepends=("kernel26-headers>=${_kernver_one}" "kernel26-headers<${_kernver_two}"
             "kernel26${_suffix}>=${_kernver_one}" "kernel26${_suffix}<${_kernver_two}")
source=("http://www.elis.UGent.be/~ronsse/cdfs/download/${_appname}-${pkgver}.tar.bz2")
md5sums=('ac64c014a90e3c488394832ea29605b3')

build() {
  cd "${srcdir}/${_appname}-${pkgver}"

  patch cddata.c <<EOF
85c85
<   .sendfile         = generic_file_sendfile
---
> //  .sendfile         = generic_file_sendfile
EOF

  make KDIR=/usr/src/linux-${_kernver} || return 1
  mkdir -p "${pkgdir}/lib/modules/${_kernver}/extra" && \
  cp cdfs.ko "${pkgdir}/lib/modules/${_kernver}/extra"
}
