# Maintainer: Diego <cdprincipe@at@gmail@dot@com>

pkgname=moka-dark-icon-theme
pkgver=0.3.0
pkgrel=1
pkgdesc="Moka is meant to be a comprehensive and well-designed icon set."
arch=('any')
url="https://launchpad.net/~snwh/+archive/moka-icon-theme-daily/+packages"
license=('GPL3')

source=('https://launchpad.net/~snwh/+archive/moka-icon-theme-daily/+files/moka-icon-theme-dark_0.3.0-0%7E53%7Eubuntu13.10.1_all.deb')
md5sums=('0b4ec6c9eae715a251614a695f840177')

package() {
  # Extract
  cd $srcdir
  tar -xvf data.tar.gz
  
  # create theme dirs
  install -d -m 755 "$pkgdir"/usr/share/icons/Moka-Dark

  # install theme
  cd $srcdir/usr/share/icons/Moka-Dark/
  cp -r . "$pkgdir"/usr/share/icons/Moka-Dark/
}
