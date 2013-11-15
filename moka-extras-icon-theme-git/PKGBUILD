# Maintainer: mereghost <marcello.rocha@gmail.com>
# Original PKGBUILB from moka-icon-theme-git by: Diego <cdprincipe@at@gmail@dot@com>

_pkgname=moka-icon-theme-extras
pkgname=moka-extras-icon-theme-git
pkgver=5.bbe95dd
pkgrel=3
pkgdesc="Moka is meant to be a comprehensive and well-designed icon set."
arch=('any')
url="https://github.com/snwh/moka-icon-theme-extras"
license=('GPL3')
depends=()
makedepends=('git')
optdepends=()
provides=('moka-extras-icon-theme')
source=('git://github.com/snwh/moka-icon-theme-extras.git')
md5sums=('SKIP')

pkgver() {
  cd $srcdir/$_pkgname
  echo $(git rev-list --count HEAD).$(git rev-parse --short HEAD)
}

package() {
  cd $srcdir/moka-icon-theme-extras/Moka

  # create theme dirs
  install -d -m 755 "$pkgdir"/usr/share/icons/Moka

  # install theme
  cp -r . "$pkgdir"/usr/share/icons/Moka/
}

