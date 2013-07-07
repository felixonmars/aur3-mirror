# Maintainer: Daniel Mendler <mail at daniel-mendler.de>
# Contributor: Daniel Mendler <mail at daniel-mendler.de>
pkgname=pacgem
pkgver=0.9.11
pkgrel=1
pkgdesc="Install Ruby Gems as Arch Linux packages"
arch=('any')
url="http://github.com/minad/pacgem"
license=('GPL')
depends=('ruby')
source=('pacgem' 'pacgem.8')
sha256sums=('4f82110840f053d8c51897c790352e688b0594c591dc054dd57f9fe27fead23d'
            'bbb30b02573e5625e3d7ddb1bd177db2165c383b5181769dbb655b398e1c0853')
conflicts=('pacgem-git')

package() {
  install -D -m755 $srcdir/pacgem $pkgdir/usr/bin/pacgem
  install -D -m644 $srcdir/pacgem.8 $pkgdir/usr/share/man/man8/pacgem.8
}
