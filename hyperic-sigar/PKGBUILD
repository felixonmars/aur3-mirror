#Contributor: Thomas Dziedzic < gostrc at gmail >

pkgname=hyperic-sigar
pkgver=1.6.4
pkgrel=1
pkgdesc='The Sigar API provides a portable interface for gathering system information.'
arch=('i686' 'x86_64')
[ ${CARCH} = 'i686' ] && _arch=x86
[ ${CARCH} = 'x86_64' ] && _arch=amd64
url='http://support.hyperic.com/display/SIGAR/Home'
license=('custom')
depends=('java-environment')
makedepends=('apache-ant')
source=("https://github.com/hyperic/sigar/tarball/sigar-${pkgver}"
        'sigar')
md5sums=('49497dfcd7d00f700e3d3d73ca076a15'
         '0a296ea20937361e5cff514120f6e5f2')

build() {
  # install executable
  install -D sigar "$pkgdir/usr/bin/sigar"

  cd hyperic-sigar-d156ef4/bindings/java/

  ant

  cd sigar-bin

  mkdir -p "$pkgdir/usr/share/sigar"

  # install headers
  cp -r include "$pkgdir/usr"

  # install libs
  cp lib/* "$pkgdir/usr/share/sigar"

  install -d "$pkgdir/usr/lib"
  install -m644 lib/libsigar-${_arch}-linux.so "$pkgdir/usr/lib"
}
md5sums=('0899e88874b40b6602f617645f88acb6'
         '0a296ea20937361e5cff514120f6e5f2')
