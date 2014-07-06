# Maintainer: Kamil Wisniewski (FORMOZA) <formoza@autistici.org>

pkgname=openfm-32
pkgver=3.0.3.180
pkgrel=2
pkgdesc="Open FM on your PC. Faster access to your favorite stations."
arch=(i686)
url=http://open.fm/
license=(Freeware)
depends=('alsa-lib' 'libcanberra' 'libcanberra-pulse' 'xorg-server')
install=$pkgname.install
provides=($pkgname)
source=(http://updates.open.fm/files/elwood/release/linux32)
md5sums=(b5dacd1ec787ee791d44c590f0fddcd2)

package()
{
  mkdir -p $pkgdir/opt/OpenFM
  cp -R $srcdir/OpenFM $pkgdir/opt/
}