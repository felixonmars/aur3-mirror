# Contributor: Andre Klitzing <aklitzing () online () de>
pkgname=libnodave
pkgver=0.8.4.4
pkgrel=1
pkgdesc="Exchange data with Siemens PLCs"
arch=('i686' 'x86_64')
url="http://sourceforge.net/projects/libnodave"
license=('LGPL')
source=(http://downloads.sourceforge.net/$pkgname/${pkgname}-${pkgver}.zip amd64_fpic.patch)
md5sums=('d3f960408bbfc811e107b61d387f8bba'
         'eab02468487aef078bfda2e60a15cb60')

build() {
  cd "$srcdir"
 
  if [ "${CARCH}" = "x86_64" ]; then
      patch -Np0 -i amd64_fpic.patch || return 1
  fi

  make libnodave.so || return 1
  install -D -m 644 libnodave.so $pkgdir/usr/lib/libnodave.so || return 1
  install -D -m 644 nodave.h $pkgdir/usr/include/nodave.h || return 1
}

# vim:set ts=2 sw=2 et:
