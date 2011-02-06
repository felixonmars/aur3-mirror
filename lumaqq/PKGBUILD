# Original-Contributor: Cary <txcary@gmail.com>
# Contributor: Ole <ole.roessler@gmail.com>
pkgname=lumaqq
pkgver=2006M2
pkgrel=2
pkgdesc="QQ protocol instant messaging client"
license=('GPL')
arch=('i686' 'x86_64' 'ppc')

_arch="${CARCH}"
[ "${CARCH}" = "i686" ] && _arch="x86"

url="http://lumaqq.linuxsir.org"
makedepends=('bash')
depends=('openjdk6' 'gtk2')
source=(http://lumaqq.linuxsir.org/download/2006/lumaqq_${pkgver}-linux_gtk2_${_arch}_no_jre.tar.gz LumaQQ.desktop)

md5sums=('c395c148cad5f363996d983e8bdbb58a'
         '08713e3e179176d5c4defef3df29b272')
[ "${CARCH}" = "i686" ] && md5sums[0]='104d8cb1a5d02d661dddb4517487813a'
[ "${CARCH}" = "ppc" ] && md5sums[0]='998d709e8bcbd696b31035ba1fd96580'

build() {
  mkdir -p $startdir/pkg/opt/lumaqq
  cp -r $startdir/src/LumaQQ/* $startdir/pkg/opt/lumaqq
  mkdir -p $startdir/pkg/usr/share/applications
  cp $startdir/LumaQQ.desktop $startdir/pkg/usr/share/applications
}
