# Maintainer: Diego <cdprincipe@at@gmail@dot@com>
 
pkgname=faenza-xfce-addon-git
pkgver=0.2.1.1.g692974a
pkgrel=1
pkgdesc="Add-On package for the faenza Icon Theme to provide better xfce integration"
url="http://xfce-look.org/content/show.php/Faenza-Xfce?content=142885"
license=('GPL')
arch=('any')
depends=('faenza-icon-theme')
makedepends=('git')
provides=('faenza-xfce-addon')
conflicts=('faenza-xfce-addon')
source=("git://github.com/shimmerproject/Faenza-Xfce.git")
md5sums=('SKIP')

pkgver() {
  cd $srcdir/Faenza-Xfce
  echo $(git describe --always | sed 's/^v//;s/-/./g;s/_/./g;' | grep -o '[0-9]..*')
}
 
package() {
  cd $srcdir/Faenza-Xfce

  # create theme dir
  install -d -m 755 "$pkgdir"/usr/share/icons/Faenza-Xfce

  # clean up
  rm -rf {.git,.gitignore,CREDITS,LICENSE,README}

  # install theme
  cp -r . "$pkgdir"/usr/share/icons/Faenza-Xfce/
}
