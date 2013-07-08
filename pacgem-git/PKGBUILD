# Maintainer: Daniel Mendler <mail at daniel-mendler.de>
# Contributor: Daniel Mendler <mail at daniel-mendler.de>
pkgname=pacgem-git
pkgver=0.9.10.137.6869d27
pkgrel=1
pkgdesc="Install Ruby Gems as Arch Linux packages"
arch=('any')
url="http://github.com/minad/pacgem"
license=('GPL')
depends=('ruby')
source=('pacgem::git+https://github.com/minad/pacgem.git')
md5sums=('SKIP')
provides=('pacgem')

_provides_pkgver() {
  cd $srcdir/pacgem
  git describe --tags | sed 's|v||'
}

pkgver() {
  cd $srcdir/pacgem
  echo $(_provides_pkgver).$(git rev-list --count HEAD).$(git rev-parse --short HEAD)
}

package() {
  provides=("pacgem=$(_provides_pkgver)")
  install -D -m755 $srcdir/pacgem/pacgem $pkgdir/usr/bin/pacgem
  install -D -m644 $srcdir/pacgem/pacgem.8 $pkgdir/usr/share/man/man8/pacgem.8
}
