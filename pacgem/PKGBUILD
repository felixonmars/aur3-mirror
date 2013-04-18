# Maintainer: Daniel Mendler <mail at daniel-mendler.de>
# Contributor: Daniel Mendler <mail at daniel-mendler.de>
pkgname=pacgem
pkgver=0.9.8
pkgrel=1
pkgdesc="Install Ruby Gems as Arch Linux packages"
arch=('any')
url="http://github.com/minad/pacgem"
license=('GPL')
depends=('ruby')
source=('pacgem' 'pacgem.8')
sha256sums=('c92451611ed4552d3d4783eb64bdaeb17b5e1bb683275d0eb3a12f7b1ba620c7'
            '7bf130ee57f39bcb06d38d179808d15f61a413ea29631a96dd0625ef236808e1')
conflicts=('pacgem-git')

package() {
  install -D -m755 $srcdir/pacgem $pkgdir/usr/bin/pacgem
  install -D -m644 $srcdir/pacgem.8 $pkgdir/usr/share/man/man8/pacgem.8
}
