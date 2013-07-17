# Maintainer: Diego <cdprincipe@at@gmail@dot@com>

_pkgname=moka-icon-theme-dark
pkgname=moka-dark-icon-theme-git
pkgver=15.9ab12c9
pkgrel=1
pkgdesc="Moka is meant to be a comprehensive and well-designed icon set."
arch=('any')
url="https://github.com/snwh/moka-icon-theme-dark"
license=('GPL3')
depends=()
makedepends=('git')
optdepends=()
provides=('moka-dark-icon-theme')
conflicts=('moka-dark-icon-theme')
source=('git://github.com/snwh/moka-icon-theme-dark.git')
md5sums=('SKIP')

pkgver() {
  cd $srcdir/$_pkgname
  echo $(git rev-list --count HEAD).$(git rev-parse --short HEAD)
}

package() {
  cd $srcdir/$_pkgname/Moka-Dark

  # create theme dirs
  install -d -m 755 "$pkgdir"/usr/share/icons/Moka-Dark

  # install theme
  cp -r . "$pkgdir"/usr/share/icons/Moka-Dark/
}

