# Contributor: Daniel Mendler <mail@daniel-mendler.de>

pkgname=pacgem
pkgver=0.3
pkgrel=1
pkgdesc="Install Ruby Gems as Arch Linux packages"
arch=('any')
url="http://github.com/minad/pacgem"
license=('Ruby')
depends=('ruby')
source=('pacgem' 'pacgem.8')
sha256sums=('698b895f0907a547f127d45ca14af3c90a4ffbe788b26e4036f382584f6009c4'
	    '117f5733bb7063d51defa96963ca62e80400f309c5b55faf5c31e60498b446e7')

build() {
  install -D -m755 $srcdir/pacgem $pkgdir/usr/bin/pacgem
  gzip -c $srcdir/pacgem.8 > $srcdir/pacgem.8.gz
  install -D -m644 $srcdir/pacgem.8.gz $pkgdir/usr/share/man/man8/pacgem.8.gz
}
