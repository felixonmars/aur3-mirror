# Contributor: Daniel Mendler <mail@daniel-mendler.de>

pkgname=pacgem
pkgver=0.1
pkgrel=3
pkgdesc="Install Ruby Gems as Arch Linux packages"
arch=('any')
url="http://github.com/minad/pacgem"
license=('Ruby')
depends=('ruby')
source=('pacgem')
sha256sums=('99ad1052fb4db0828ec7437e5b8de3bb7b7d7167755c44d129d01f4ececaa081')

build() {
  install -D -m755 $srcdir/pacgem $pkgdir/usr/bin/pacgem
}
