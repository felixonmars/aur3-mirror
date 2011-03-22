# Maintainer: Daniel Mendler <mail at daniel-mendler.de>
# Contributor: Daniel Mendler <mail at daniel-mendler.de>
pkgname=pacgem
pkgver=0.9.3
pkgrel=1
pkgdesc="Install Ruby Gems as Arch Linux packages"
arch=('any')
url="http://github.com/minad/pacgem"
license=('GPL')
depends=('ruby')
source=('pacgem' 'pacgem.8')
sha256sums=('e4628e592d0f3c652a27fafbffa58897b0eaf0e1b14b04a17aa407dbc28895a8'
            '6a893f7246f88e294968b95ff0a441b230b5b4b6fc7dfe05eb7fa4eed957906d')
conflicts=('pacgem-git')

package() {
  install -D -m755 $srcdir/pacgem $pkgdir/usr/bin/pacgem
  install -D -m644 $srcdir/pacgem.8 $pkgdir/usr/share/man/man8/pacgem.8
}
