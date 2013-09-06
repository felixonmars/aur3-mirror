# Maintainer: Diego <cdprincipe@at@gmail@dot@com>

pkgname=moka-blue-icon-theme
pkgver=0.4
pkgrel=1
pkgdesc="Moka is meant to be a comprehensive and well-designed icon set."
arch=('any')
url="https://launchpad.net/~snwh/+archive/moka-icon-theme-daily/+packages"
license=('GPL3')

source=('https://launchpad.net/~snwh/+archive/moka-icon-theme-daily/+files/moka-icon-theme-blue_0.4-0%7E13%7Eubuntu13.10.1_all.deb')
md5sums=('83699487f3e46974397adbf2216a99fe')

package() {
  # Extract
  cd $srcdir
  tar -xvf data.tar.gz

  # create theme dirs
  install -d -m 755 "$pkgdir"/usr/share/icons/Moka-Blue
  install -d -m 755 "$pkgdir"/usr/share/icons/Moka-Dark-Blue

  # install theme
  cd $srcdir/moka-icon-theme-blue/Moka-Blue
  cp -r . "$pkgdir"/usr/share/icons/Moka-Blue/
  cd $srcdir/moka-icon-theme-blue/Moka-Dark-Blue
  cp -r . "$pkgdir"/usr/share/icons/Moka-Dark-Blue/


}
