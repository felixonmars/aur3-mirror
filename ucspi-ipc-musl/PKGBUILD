# Contributor: Roberto Alsina <ralsina@kde.org>
pkgname=ucspi-ipc-musl
pkgver=0.67
pkgrel=2
pkgdesc="Command-line tools for building local-domain client-server applications."
url="http://www.superscript.com/ucspi-ipc/"
arch=('i686' 'x86_64')
license=(custom)
makedepends=(musl)
conflicts=(ucspi-ipc)
provides=(ucspi-ipc)
source=("${url}/ucspi-ipc-${pkgver}.tar.gz" ${pkgname}.patch)
md5sums=('68439fc45f7a52a481667aebe14b3a33'
         '4cf51b47b7b0014bfede3e8b3eb62649')

build() {
  cd $srcdir/host/superscript.com/net/ucspi-ipc-${pkgver}
  patch -p1 -i $srcdir/${pkgname}.patch
  echo musl-gcc         > src/conf-cc
  echo musl-gcc -static > src/conf-ld
  echo $pkgdir/usr/bin  > package/command-cp
  echo                  > package/command-ln
  
  package/compile base
}

package() {
  cd $srcdir/host/superscript.com/net/ucspi-ipc-${pkgver}
  package/install base
}
