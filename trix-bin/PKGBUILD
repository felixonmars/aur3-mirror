# Maintainer: Batyr Komdoshev <batyrok@gmail.com>
# Contributor: Batyr Komdoshev
pkgname=trix-bin
pkgver=0.94
pkgrel=1
pkgdesc="vypress compatible qt chat (can work without server)"
arch=('x86_64')
url="http://trix.sourceforge.net"
license=('GPL')
depends=(qt3 p7zip)
source=(http://sourceforge.net/projects/trix/files/trix/trix-0.94/trix_0.94-1ubuntu1_amd64.deb)
md5sums=('898ce535bdca090c30e2236f967d63d8')

package() {
   7z e trix_0.94-1ubuntu1_amd64.deb -osrc
   7z x src/data.tar -o$pkgdir
   chmod -R 0755 $pkgdir
 }
