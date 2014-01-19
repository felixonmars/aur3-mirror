# Maintainer: Diego <cdprincipe@at@gmail@dot@com>

pkgname=moka-icon-theme
pkgver=2.0
pkgrel=46
pkgdesc="Moka is meant to be a comprehensive and well-designed icon set."
arch=('any')
url="http://mokaproject.com/moka-icon-theme/"
license=('GPL3') 
depends=(
    'faba-icon-theme'
    )

source=('https://launchpad.net/~moka/+archive/moka-icon-theme/+files/moka-icon-theme_2.0-0~46~ubuntu14.04.1.tar.gz')
md5sums=('e4bc4769bff651f54d38f34ad8dd601d')
package() {
  # Extract
  cd $srcdir/recipe-{debupstream}-0~{revno}/Moka

  
  # create theme dirs
  install -d -m 755 "$pkgdir"/usr/share/icons/Moka

  # install theme
  cp -r . "$pkgdir"/usr/share/icons/Moka/
  find "${pkgdir}"/usr/share/icons -type d -exec chmod 755 '{}' \;
  find "${pkgdir}"/usr/share/icons -type f -exec chmod 644 '{}' \;
}
