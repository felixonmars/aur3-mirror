# Maintainer: Diego <cdprincipe@at@gmail@dot@com>

_pkgname=moka-icon-theme-blue
pkgname=moka-blue-icon-theme-git
pkgver=14.fb5629c
pkgrel=1
pkgdesc="Moka is meant to be a comprehensive and well-designed icon set."
arch=('any')
url="https://github.com/snwh/moka-icon-theme-blue"
license=('GPL3')
depends=()
makedepends=('git')
optdepends=()
provides=('moka-blue-icon-theme')
conflicts=('moka-blue-icon-theme')
source=('git://github.com/snwh/moka-icon-theme-blue.git')
md5sums=('SKIP')

pkgver() {
  cd $srcdir/$_pkgname
  echo $(git rev-list --count HEAD).$(git rev-parse --short HEAD)
}

package() {

  # create theme dirs
  install -d -m 755 "$pkgdir"/usr/share/icons/Moka-Blue
  install -d -m 755 "$pkgdir"/usr/share/icons/Moka-Dark-Blue

  # install theme
  cd $srcdir/moka-icon-theme-blue/Moka-Blue
  cp -r . "$pkgdir"/usr/share/icons/Moka-Blue/
  cd $srcdir/moka-icon-theme-blue/Moka-Dark-Blue
  cp -r . "$pkgdir"/usr/share/icons/Moka-Dark-Blue/
}

